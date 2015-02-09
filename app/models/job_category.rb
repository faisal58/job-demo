class JobCategory < ActiveRecord::Base

  has_many :jobs
  has_many :job_applications

end
