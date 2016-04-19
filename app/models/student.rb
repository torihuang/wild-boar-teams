class Student < ActiveRecord::Base
  validates :team_id, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  validates :grade, presence: true
  validates :gpa, presence: true
  validates :number_of_detentions, presence: true
  validates :shirt_size, presence: true

  belongs_to :team
  has_one :teacher, through: :team

  def is_assigned?
    self.team_id != nil
  end

end

