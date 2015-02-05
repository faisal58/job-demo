module ApplicationHelper

  def is_seeker?
    current_user.role == 'seeker'
  end

  def is_employer?
    current_user.role == 'employer'
  end

end
