module KeyedByName
  def self.included(klass)
    klass.extend(ClassMethods)
    klass.send(:named_scope, :nil_names, :conditions => {:name => nil})
    klass.send(:named_scope, :with_name, lambda { |name| {:conditions => {:name => name}}})
  end


  module ClassMethods
    def named(name)
      self.with_name(name).first
    end
  end
end  