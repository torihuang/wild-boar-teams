class Team < ActiveRecord::Base

  belongs_to :teacher, class_name: "User", foreign_key: :teacher_id
  has_many :students


  def number_of_detentions
    return self.students.inject(0) { |sum, student| sum + student.number_of_detentions }
  end

  def average_gpa
    return ((self.students.inject(0) { |sum, student| sum + student.gpa }) / self.students.count).round(2)
  end
end