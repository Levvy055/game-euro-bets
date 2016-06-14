class Bet < ActiveRecord::Base
    belongs_to :user
    belongs_to :match
    has_one :country_a, class_name: 'Country', through: :match
    has_one :country_b, class_name: 'Country', through: :match
    
    scope :active, -> {joins(:match).where('matches.start_time > ?', DateTime.now)}
    scope :done, -> {joins(:match).where('matches.start_time <= ?', DateTime.now)}
    
    def points
        m = self.match
        if m.got_score
            ar, br = m.score_a - score_a, m.score_b - score_b 
            oab, rab = score_a - score_b, m.score_a - m.score_b
            ss_check=(oab > 0 && rab > 0) || (oab < 0 && rab < 0) || (oab == 0 && rab == 0)
            if ar==0 && br==0
                3
            elsif ss_check
                1
            else
                0
            end
        end 
    end
    
    validates :user, presence: true
    validates :match, presence: true
    validates_uniqueness_of :user, scope: [:match]
end
