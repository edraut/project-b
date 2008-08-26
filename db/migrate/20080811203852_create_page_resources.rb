class CreatePageResources < ActiveRecord::Migration
  def self.up
    create_table :page_resources do |t|
      t.string :resource_type
      t.integer :resource_id
      t.references :page
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :page_resources
  end
end
