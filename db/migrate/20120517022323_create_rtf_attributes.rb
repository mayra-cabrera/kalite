class CreateRtfAttributes < ActiveRecord::Migration
  def self.up
    create_table :rtf_attributes do |t|
      t.references  :attribute,   :null => false
      t.references  :rtf,         :null => false
      t.float    :weight,      :null => false
      t.timestamps
    end
  end
  
  def self.down
    drop_table :rtf_attributes
  end
end
