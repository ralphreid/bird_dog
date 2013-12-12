class UsersController < Devise::RegistrationsController

  def index
    @users = User.all
  end

  def create
    super
  end

end