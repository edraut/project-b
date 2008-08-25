class Project < ActiveRecord::Base
  has_one :article_image, :as => :attachable, :dependent => :destroy
  named_scope :nil_names, :conditions => {:name => nil}
end
