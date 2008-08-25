class ImageElement < Attachment
  include KeyedByName
  belongs_to :attachable, :polymorphic => true
  has_attachment :content_type => :image,
                 :storage => :file_system,
                 :max_size => 2.megabytes,
                 :resize_to => '950x700>',
                 :thumbnails => {:thumb => '80x80>',:medium_thumb => '160x160>'},
                 :path_prefix => 'public/uploaded_files/image_elements'
  validates_as_attachment
end