class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name, null: false, unique: true
      t.string :code, null: false, unique: true
      
      t.references :group, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
