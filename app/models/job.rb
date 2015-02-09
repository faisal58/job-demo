class Job < ActiveRecord::Base

  has_many :job_applications
  belongs_to :user
  belongs_to :job_category

  validates :title, :presence => true, :length => { :minimum => 20, :maximum => 250 }
  validates :location, :presence => true
  validates :salary_range, :numericality => { :greater_than_or_equal_to => 500, :less_than_or_equal_to => 500000 }
  validates :application_deadline, :presence => true
  validate :limited_time


  def limited_time
    if self.application_deadline.present? && (self.application_deadline <= Time.now || self.application_deadline >= 1.month.from_now)
       errors.add(:application_deadline, " must be in between 30 days from now ")
    end
  end

end
