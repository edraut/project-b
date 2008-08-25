class PageResource < ActiveRecord::Base
  include KeyedByName
  named_scope :of_type, lambda { |resource_type| { :conditions => {:resource_type => resource_type}}}
end
