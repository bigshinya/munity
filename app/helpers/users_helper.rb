module UsersHelper
  def set_full_name(user)
   full_name = "#{user.first_name} #{user.last_name}"
  end

  def current_user?(user)
    user == current_user
  end
end
