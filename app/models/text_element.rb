class TextElement < ActiveRecord::Base
  include KeyedByName
  belongs_to :page
  
end
