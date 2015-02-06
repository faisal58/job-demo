class Job < ActiveRecord::Base

  belongs_to :user
  has_one :job_category

end
