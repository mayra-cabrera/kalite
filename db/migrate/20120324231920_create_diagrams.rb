class CreateDiagrams < ActiveRecord::Migration
  def change
    create_table :diagrams do |t|
      t.string :name, :limit => 50, :null => false
      t.string :folio,              :null => false
      t.timestamps
    end
  end
end
