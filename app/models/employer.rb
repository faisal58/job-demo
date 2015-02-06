class Employer < ActiveRecord::Base

  belongs_to :user
  belongs_to :company_type

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :company_name, :presence => true

end
