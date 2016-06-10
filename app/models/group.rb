class Group < ActiveRecord::Base
    has_many :countries, through: :country_groups_assignments
    
    validates :name, presence: true, uniqueness: true
end
