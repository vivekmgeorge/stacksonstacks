require 'spec_helper'

describe AnswerController  do

	it "#index" do
		get :index
		expect(assigns(:answers)).to eq Answer.all
	end

	it "#new" do
		get :new
		expect(assigns(:answers)).to eq Post.last
	end

end
	