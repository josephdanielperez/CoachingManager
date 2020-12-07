class Appointment < ApplicationRecord
    belongs_to :user
    belongs_to :employee

    validates :time, uniqueness: true 

    validate :valid_time
    scope :chrono, -> {order(:time)}
    scope :reverse_chrono, -> {order(:time).reverse_order}

    def valid_time
        if time.hour < 5 || time.hour > 19.5
            errors.add(:time, "hour must be between 5am and 7:30pm")
        end
        if time.strftime("%M") != "00" && time.strftime("%M") != "30"
            errors.add(:time, "minute of hour must be 00 or 30")
        end 
        if time <= Time.now 
            errors.add(:time, "must be booked a day in advance")
        end
    end

    #def self.chronological
    #    self.order('(appointments.time) asc')
    #end

end