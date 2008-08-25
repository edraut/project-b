class ContentTemplate < ActiveRecord::Base
  named_scope :nil_names, :conditions => {:name => nil}
  has_many :pages
  has_many :template_elements, :dependent => :destroy
  has_many :template_texts, :dependent => :destroy
  has_many :template_images, :dependent => :destroy
  has_many :template_resources, :dependent => :destroy
  
  def self.type_list_for_select
    [['Page','PageTemplate'],['Partial','PartialTemplate']]
  end
  
  def self.resource_list_for_select
    [['Project','Project'],['Blog Entry','BlogEntry']]
  end
  
  def self.resource_type_list
    ['Project','BlogEntry']
  end
  
  def page_class_name
    case self.class.name
		when 'PageTemplate'
			return 'Page'
		when 'PartialTemplate'
			return 'PagePartial'
		end
  end
  
end
