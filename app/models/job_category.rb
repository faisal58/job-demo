class JobCategory < ActiveRecord::Base

  has_many :job
  has_many :job_applications

end
