class NavigationResource
  attr_accessor :id, :name, :controller_names, :action_names, :display_name, :display_class, :context, :level

  def self.instance_list
    @@instance_list ||= create_multiple( [
      { :id => 1, :name => "page", :controller_names => ['admin/pages'], :display_name => 'Page', :context => 'admin', :level => 'controller' },
      { :id => 2, :name => "content_template", :controller_names => ['admin/content_templates'], :display_name => 'Page Template', :context => 'admin', :level => 'controller' },
      { :id => 3, :name => "project", :controller_names => ['admin/projects'], :display_name => 'Project', :context => 'admin', :level => 'controller' }
    ] )
  end

  def self.create_multiple( instances )
    instances.collect do |instance| 
      self.new( instance )
    end
  end
    
  def self.find( specification )
    case( specification.class.name )
    when "NilClass"
      raise "#{self.to_s} error: Cannot fetch #{self.to_s.downcase} looking for a Nil object."
    when "Symbol"
      case( specification )
      when :all
        instance_list
      when :first
        instance_list[0]
      else
        raise "#{self.to_s} error: Fetch symbol misunderstood."
      end
    when "Fixnum"
      instance_list.detect{ |e| e.id == specification }
    when "String"
      instance_list.detect{ |e| ( e.name == specification ) || ( e.name.gsub( " ", "_" ).downcase == specification.gsub( " ", "_" ).downcase ) }
    when "Hash"
      instance_list.select do |i|
        failed = false
        specification.each do |key,value|
          case i.send(key).class.name
          when 'Array'
            failed ||= !(i.send(key).include? value)
          else
            failed ||= i.send(key) != value
          end
        end
        !failed
      end
    else
      raise "#{self.to_s} error: What type of #{self.to_s.downcase} is that?"
    end

  end
  
  def initialize( attributes )
    attributes.each do |key, value|
      if self.respond_to?( key )
        self.send( ( key.to_s + "=" ).to_sym, value )
      end
    end
  end
  
end