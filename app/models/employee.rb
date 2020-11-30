class Employee < ApplicationRecord
    has_many :appointments
    has_many :users, through: :appointments
    has_many :services
    has_many :employee_times
end