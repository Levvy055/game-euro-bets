class Match < ActiveRecord::Base
    belongs_to :country_a, class_name: :country
    belongs_to :country_b, class_name: :country
    
     validates :country_a, presence: true, uniqueness: true
     validates :country_b, presence: true, uniqueness: true
end
