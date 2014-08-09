class AnswersController < ApplicationController
	def new
		@answer = Answer.new
	end

	def create
		@answer = Answer.create(params[:id])
		@answer.question = @question
		redirect_to '/questions/'
	end

	def edit
		@answer = Answer.find(params[:id])
	end

	def show
		@answer = Answer.find(params[:id])
	end

	private

	def answer_params
		params.require(:answer).permit(:body, :question_id)
	end
end