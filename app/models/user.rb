class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  has_one :team, foreign_key: :teacher_id
  has_many :students, through: :team

  def has_student?(student)
    self.students.include?(student)
  end
end
