class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      t.integer :attachable_id
      t.string :attachable_type
      t.string :type
      t.integer :size
      t.integer :width
      t.integer :height
      t.string :content_type
      t.string :filename
      t.integer :parent_id
      t.string :thumbnail
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :attachments
  end
end
