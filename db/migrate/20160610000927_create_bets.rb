class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :score_a, null: false, default: 0
      t.integer :score_b, null: false, default: 0
      
      t.references :user, null: false,foreign_key: true
      t.references :match, null: false, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
