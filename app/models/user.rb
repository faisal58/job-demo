class User < ActiveRecord::Base

  enum role: [ :guest, :employer, :seeker ]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :employer
  has_one :seeker
  has_many :jobs
  has_many :job_applications

  before_save :convert_role_if_needed

  # make
  def convert_role_if_needed
    if self.role != 'employer'
      self.role = :seeker
    end
  end
end
