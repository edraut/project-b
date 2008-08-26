class CreateBlogEntries < ActiveRecord::Migration
  def self.up
    create_table :blog_entries do |t|
      t.string :name
      t.text :description
      t.references :article_image

      t.timestamps
    end
  end

  def self.down
    drop_table :blog_entries
  end
end
