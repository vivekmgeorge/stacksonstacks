class UsersController < ApplicationController
  def index

  end
 


  # Devise does not generate a show view for users. Overwrote
  # the UsersController and implemented our own for user profiles.
  def show
  	@user = User.find(params[:id])
  end


end