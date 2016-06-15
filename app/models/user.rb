class User < ActiveRecord::Base
    has_secure_password
    has_many :bets
    
    def bets_points
        bs = self.bets.done
        points = 0
        bs.each do |b|
            if b.points != nil
                points += b.points
            end
        end
        return points
    end

    def is_admin
        self.level == 4
    end

    validates :visible_name, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :email, presence: true, uniqueness: true
end
