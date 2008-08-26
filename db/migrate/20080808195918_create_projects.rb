class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.string :client
      t.text :description
      t.references :article_image
      t.string :site_link

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
