class User < ActiveRecord::Base

  enum role: [ :guest, :employer, :seeker ]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :convert_role_if_needed

  # make
  def convert_role_if_needed
    if self.role != 'employer'
      self.role = :seeker
    end
  end
end
