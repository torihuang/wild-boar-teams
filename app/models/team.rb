class Team < ActiveRecord::Base
  
  belongs_to :teacher, class_name: "User", foreign_key: :teacher_id
  has_many :students

end