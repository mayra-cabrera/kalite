class CreateSubsystems < ActiveRecord::Migration
  def self.up
    create_table :subsystems do |t|
      t.string  :name,          :null => false
      t.text  :description,   :null => false
      t.references :system,    :null => false
      t.timestamps
    end
  end
end
