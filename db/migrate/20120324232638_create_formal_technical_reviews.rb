class CreateFormalTechnicalReviews < ActiveRecord::Migration
  def change
    create_table :formal_technical_reviews do |t|
      t.references :administrator,    :null => false
      t.references :programmer,       :null => false
      t.references :subsystem,           :null => false
      t.references :diagram,          :null => false
      t.decimal    :result   
      t.references :score
      t.timestamps
    end
  end
end
