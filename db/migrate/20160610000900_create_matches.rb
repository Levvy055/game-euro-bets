class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :score_a, null: true
      t.integer :score_b, null: true
      t.datetime :start_time, null: false
      
      t.references :country_a, null: false
      t.references :country_b, null: false

      t.timestamps null: false
    end
  end
end
