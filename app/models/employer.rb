class Employer < ActiveRecord::Base

  belongs_to :user
  has_one :company_type

end
