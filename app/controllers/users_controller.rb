class UsersController < ApplicationController
  def index

  end

  def show
  	@user = User.find(params[:id])
    @question = Question.find(params[:id])
  end


end