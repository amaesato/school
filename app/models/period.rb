class Period < ApplicationRecord
  belongs_to :institution
  validates_presence_of :teacher, :grade

  def teacher_name_grade
    "#{teacher} - grade #{grade}"
  end

  def self.teacher_by_grade
    order(:grade)
  end

end
