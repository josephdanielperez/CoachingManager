class Employee < ApplicationRecord
    has_many :appointments
    has_many :users, through: :appointments
    has_many :employee_times

    validates :name, presence: true
end