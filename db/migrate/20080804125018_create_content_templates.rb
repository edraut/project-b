class CreateContentTemplates < ActiveRecord::Migration
  def self.up
    create_table :content_templates do |t|
      t.string :name
      t.string :path, :body_template_path
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :content_templates
  end
end
