class CreateSystems < ActiveRecord::Migration
  def self.up
    create_table :systems do |t|
      t.string :name,             :null => false
      t.text :description,      :null => false
      t.references :system_type,  :null => false
      t.timestamps
    end
  end
end
