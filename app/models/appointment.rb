class Appointment < ActiveRecord::Base
  belongs_to :pet
  belongs_to :doctor, class_name: 'User', foreign_key: :doctor_id
  belongs_to :customer, class_name: 'User', foreign_key: :customer_id
end
