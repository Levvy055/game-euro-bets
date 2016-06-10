class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.int :score_a, null: false, default: 0
      t.int :score_b, null: false, default: 0
      
      t.references :user, null: false, index: true, foreign_key: true
      t.references :match, null: false, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
