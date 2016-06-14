class Bet < ActiveRecord::Base
    belongs_to :user
    belongs_to :match
    has_one :country_a, class_name: 'Country', through: :match
    has_one :country_b, class_name: 'Country', through: :match
    
    scope :active, -> {joins(:match).where('matches.start_time > ?', DateTime.now)}
    
    
    validates :user, presence: true
    validates :match, presence: true
    validates_uniqueness_of :user, scope: [:match]
end
