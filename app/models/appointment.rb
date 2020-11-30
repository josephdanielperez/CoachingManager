class Appointment < ApplicationRecord
    belongs_to :user
    belongs_to :employee

    validates :time, uniqueness: true 

    validate :valid_time

    def valid_time
        if time.hour % 2 == 0
            errors.add(:time, "hour must be an odd number")
        end
        if time.hour < 9 || time.hour > 17
            errors.add(:time, "hour must be between 09 and 17")
        end
        if time.strftime("%M") != "00"
            errors.add(:time, "minute of hour must be 00")
        end 
        if time <= Time.now 
            errors.add(:time, "must be in the future")
        end
    end
    
end