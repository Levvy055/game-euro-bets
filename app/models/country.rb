class Country < ActiveRecord::Base
    has_many :groups, through: :country_groups_assignments
    has_many :match_a, class_name: :match, foreign_key: :country_a
    has_many :match_b, class_name: :match, foreign_key: :country_b
    
    validates :name, presence: true, uniqueness: true
    validates :code, presence: true, uniqueness: true
end
