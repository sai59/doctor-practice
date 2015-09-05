class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ROLES = %w[owner receptionist practitioner customer doctor]
  has_many :customer_appointments, class_name: 'Appointment', foreign_key: :customer_id
  has_many :doctor_appointments, class_name: 'Appointment', foreign_key: :doctor_id
  validates :password, length: { minimum: 8 }, unless: "password.nil?"
  validates :password, presence: true, if: "id.nil?"
  def is?(role)
    self.role == role.to_s
  end
end
