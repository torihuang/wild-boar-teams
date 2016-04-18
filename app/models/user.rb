class User < ActiveRecord::Base

  has_secure_password

  validates :email, presence: true, uniqueness: true

  has_one :team, foreign_key: :teacher_id
  has_many :students, through: :team

end

