class CreateCountryGroupsAssignments < ActiveRecord::Migration
  def change
    create_table :country_groups_assignments do |t|
      
      t.references :country, null: false, index: true, foreign_key: true
      t.references :group, null: false, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
