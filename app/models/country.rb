class Country < ActiveRecord::Base
    belongs_to :group
    has_many :match_a, class_name: 'Match', foreign_key: 'country_a'
    has_many :match_b, class_name: 'Match', foreign_key: 'country_b'
    
    def img
       'flags/' + self.code + '.png' 
    end
    
    validates :name, presence: true, uniqueness: true
    validates :code, presence: true, uniqueness: true
end
