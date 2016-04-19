class Student < ActiveRecord::Base
  # validates :team_id, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  validates :grade, presence: true
  validates :gpa, presence: true
  validates :number_of_detentions, presence: true
  validates :shirt_size, presence: true

  belongs_to :team
  has_one :teacher, through: :team

  require 'CSV'

  def full_name=(name)
    self.first_name = name.split(' ')[0]
    self.last_name = name.split(' ')[1]
    return name
  end

  def full_name
    return "#{self.first_name} #{self.last_name}"
  end

  def self.upload(file)
    puts "================================"
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
      attributes = row.to_hash
      attributes[:food_allergies] =attributes.delete :allergies
      attributes[:grade] =attributes.delete :grade_level
      attributes[:number_of_detentions] =attributes.delete :detentions
      Student.create!(attributes)
    end
  end
end

