class School

  def initialize
    @school = Hash.new { |hash, key| hash[key] = [] }
  end

  def add(student, grade)
    raise ArgumentError, 'Please insert valid data' if grade < 1 || student.nil?
    school[grade].push(student).sort!
  end

  def students(grade_wanted)
    school[grade_wanted]
  end

  def students_by_grade
    school.map do |grade, students|
      { grade: grade, students: students }
    end.sort_by {|school| school[:grade] }
  end

  private

  attr_reader :school

end
