class CompanyType < ActiveRecord::Base

  has_many :employer

  validates :name, :presence => true, :uniqueness => true

end
