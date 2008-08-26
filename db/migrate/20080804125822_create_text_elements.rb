class CreateTextElements < ActiveRecord::Migration
  def self.up
    create_table :text_elements do |t|
      t.string :name
      t.text :content
      t.references :page

      t.timestamps
    end
  end

  def self.down
    drop_table :text_elements
  end
end
