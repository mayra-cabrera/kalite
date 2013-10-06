class CreateAttributes < ActiveRecord::Migration
  def self.up
    create_table :attributes do |t|
      t.string :name, :limit => 20, :null => false
      t.timestamps
    end
  end
end
