class JobCategory < ActiveRecord::Base

  belongs_to :job
  has_many :job_applications

end
