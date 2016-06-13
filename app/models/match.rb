class Match < ActiveRecord::Base
    belongs_to :country_a, class_name: 'Country'
    belongs_to :country_b, class_name: 'Country'
    
    def are_bets_active
       self.start_time > DateTime.now 
    end
    
    validates :country_a, presence: true
    validates :country_b, presence: true
    validates :start_time, presence: true
end
