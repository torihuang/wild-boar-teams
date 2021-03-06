class User < ActiveRecord::Base

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true

  has_one :team, foreign_key: :teacher_id
  has_many :students, through: :team

  def has_student?(student)
    self.students.include?(student)
  end

  def is_admin?
    self.role == "admin"
  end
end
