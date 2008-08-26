class ArticleImage < Attachment
  belongs_to :attachable, :polymorphic => true
  has_attachment :content_type => :image,
                 :storage => :file_system,
                 :max_size => 2.megabytes,
                 :resize_to => '950x700>',
                 :thumbnails => {:thumb => '80x80>',:medium_thumb => '160x160>',:large_thumb => '320x320>'},
                 :path_prefix => 'public/uploaded_files/article_images'
  validates_as_attachment
end