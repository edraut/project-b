class Page < ActiveRecord::Base
  include KeyedByName
  has_many :image_elements, :as => :attachable, :dependent => :destroy
  has_many :text_elements, :dependent => :destroy
  has_many :page_partials
  has_many :page_common_partials
  has_many :page_dependent_partials
  belongs_to :content_template
  has_many :page_resources, :dependent => :destroy
    
  def get_element(template_element)
    self.send(template_element.element_class_name.underscore.pluralize.to_sym).select{|element| element.name == template_element.name}.first
  end
  
end
