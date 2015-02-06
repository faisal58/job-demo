class Seeker < ActiveRecord::Base

  belongs_to :user

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :dob, :presence => true
  validate :check_adult
  validates :objective, :presence => true
  validates :expected_salary, :numericality => { :greater_than_or_equal_to => 500, :less_than_or_equal_to => 500000 }

  def check_adult
    if dob.present? && dob > 18.years.ago
      errors.add(:dob, " must be at least 18 years old ")
    end
  end

end
