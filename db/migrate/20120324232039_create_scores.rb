class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string :description,        :null => false
      t.float :start,        :null => false
      t.float :end,        :null => false
      t.timestamps
    end
  end
end
