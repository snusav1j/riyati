module UsersHelper

  def user_roles_list
    if current_user.director?
      User::DIRECTOR_ROLES
    elsif current_user.ceo?
      User::CEO_ROLES
    end
  end
  
end
