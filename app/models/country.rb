class Country < ActiveRecord::Base
    has_many :groups, through: :country_groups_assignments
    validates :name, presence: true, uniqueness: true
    validates :code, presence: true, uniqueness: true
end
