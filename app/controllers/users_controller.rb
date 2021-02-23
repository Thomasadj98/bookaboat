class UsersController < ApplicationController

  def become_host
    @user = current_user
    @user.host = true
    @user.save!
  end
end
