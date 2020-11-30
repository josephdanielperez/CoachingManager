class User < ApplicationRecord
    has_many :appointments
    has_many :employees, through: :appointments

    has_secure_password

    validates :email, presence: true, uniqueness: true 
    validates :password, confirmation: true 

    def self.most_appointments
        ### RETURNS NAME OF USER WITH MOST APPOINTMENTS ###
        most = self.joins(:appointments).group('users.id').order('count(appointments.id) desc').limit(1).first
    end

end