class CreateConcepts < ActiveRecord::Migration
  def change
    create_table :concepts do |t|
      t.text :description,                                    :null => false
      t.string :folio,                                        :null => false                
      t.boolean :is_automatic,                                 :null => false
      t.references  :attribute,                               :null => false
      t.references  :section,                                 :null => false                   
      t.references  :diagram,                                 :null => false
      t.timestamps
    end
  end
end
