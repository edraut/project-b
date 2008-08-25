class TemplateElement < ActiveRecord::Base
  include KeyedByName
  belongs_to :content_template
  
  def element_class_name
    case self.class.name
		when 'TemplateText'
			return 'TextElement'
		when 'TemplateImage'
			return 'ImageElement'
		when 'TemplateResource'
			return 'PageResource'
		end
  end
  
end
