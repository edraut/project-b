class CreateTemplateElements < ActiveRecord::Migration
  def self.up
    create_table :template_elements do |t|
      t.string :name
      t.string :type
      t.references :content_template
      t.string :resource_type
      t.timestamps
    end
  end

  def self.down
    drop_table :template_elements
  end
end
