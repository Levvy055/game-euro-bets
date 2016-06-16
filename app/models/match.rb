class Match < ActiveRecord::Base
    belongs_to :country_a, class_name: 'Country'
    belongs_to :country_b, class_name: 'Country'
    has_many  :bets
    
    def are_bets_active
       self.start_time.utc > (DateTime.now.utc + 2.hours)
    end
    
    def got_score
       self.score_a != nil && self.score_b != nil && !are_bets_active
    end
    
    validates :country_a, presence: true
    validates :country_b, presence: true
    validates :start_time, presence: true
end
