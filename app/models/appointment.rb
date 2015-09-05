class Appointment < ActiveRecord::Base
  belongs_to :practitioner
  belongs_to :customer
  belongs_to :pet
end
