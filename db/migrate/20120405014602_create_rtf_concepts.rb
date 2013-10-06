class CreateRtfConcepts < ActiveRecord::Migration
  def self.up
    create_table :rtf_concepts do |t|
      t.references :rtf,  :null => false
      t.references :concept,  :null => false
      t.float     :weight
      t.integer   :grade
      t.float     :total
      t.timestamps
    end
  end
end
