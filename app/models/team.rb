class Team < ActiveRecord::Base

  belongs_to :teacher, class_name: "User", foreign_key: :teacher_id
  has_many :students


  def number_of_detentions
    return self.students.inject(0) { |sum, student| sum + student.number_of_detentions }
  end

  def average_detentions
    return ((self.students.inject(0) { |sum, student| sum + student.number_of_detentions }) / self.students.count).round(2)
  end

  def average_gpa
    return ((self.students.inject(0) { |sum, student| sum + student.gpa }) / self.students.count).round(2)
  end

  def allow_update(student_to_add)
    evaluation = []
    if self.students.count <= 2
      evaluation << true 
    else
      problems = self.check_add_student_errors(student_to_add)
      if !problems[0].nil? || !problems[1].nil?
        evaluation << false 
        evaluation << problems
      else
        evaluation << true
      end
    end
  end

  def check_add_student_errors(student_to_add)
    problems = []
    if self.students.count >= 5
      problems << self.future_average_gpa(student_to_add)[0]
      problems << self.future_gender_diversity(student_to_add)[0]
    else self.students.count >= 2
      problems << self.future_gender_diversity(student_to_add)[0]
    end
    problems
  end

  def future_average_gpa(student_to_add)
    problem = []
    team_count = self.students.count
    total_gpas = self.average_gpa * team_count
    future_average = ( total_gpas + student_to_add.gpa) / ( team_count + 1 )
    if future_average <= 2.0
      problem << "Adding this student will bring your team's average GPA below 2.0"
    elsif future_average >= 3.6
      problem << "Adding this student will bring your team's average GPA above 3.6"
    end
    problem      
  end

  def current_gender_diversity
    male = 0.0
    female = 0.0
    none = 0.0
    other = 0.0
    self.students.each do |student|
      case student.gender
      when "male"
        male += 1
      when "female"
        female += 1
      when "other"
        other += 1
      when "none"
        none += 1
      end
    end
    team_count = self.students.count
    percentages = [ male/team_count, female/team_count, 
      other/team_count, none/team_count ]
  end

  def future_gender_diversity(student_to_add)
    problem = []
    current_percentages = self.current_gender_diversity
    team_count = self.students.count
    case student_to_add.gender
    when "male"
      current_males = team_count * current_percentages[0]
      if ( ( current_males + 1 ) / ( team_count + 1) ) > 0.66666 
        problem << "Adding this student would give you too many males on your team"
      end
    when "female"
      current_females = team_count * current_percentages[1]
      if ( (current_females + 1 ) / ( team_count + 1) ) > 0.6666 
        problem << "Adding this student would give you too many females on your team"
      end
    when "other"
      current_other = team_count * current_percentages[2]
      if ( ( current_other + 1 ) / ( team_count + 1) ) > 0.6666 
        problem << "Adding this student would give you too many students who identify as 'other' gender on your team"
      end
    when "none"
      current_none = team_count * current_percentages[3]
      if ( ( current_none + 1 ) / ( team_count + 1) ) > 0.6666
        problem << "Adding this student would give you too many students who identify as gender-none on your team"
      end
    end
    problem
  end

end