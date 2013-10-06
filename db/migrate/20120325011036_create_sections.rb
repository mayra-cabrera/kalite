class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.string  :name,                :null => false
      t.references  :diagram,         :null => false
      t.timestamps
    end
  end
end
