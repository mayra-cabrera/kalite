class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|
      t.references :attribute,    :null => false
      t.references :diagram,      :null => false
      t.float      :weight     
      t.references :system_type,  :null => false
      t.timestamps 
      
    end
  end
end
