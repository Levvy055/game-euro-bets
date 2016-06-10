class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.int :score_a, null: true
      t.int :score_b, null: true
      
      t.references :country_a, null: false, index: true, foreign_key: true
      t.references :country_b, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
