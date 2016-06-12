class Group < ActiveRecord::Base
    has_many :country
    
    validates :name, presence: true, uniqueness: true
end
