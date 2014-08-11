class AnswersController < ApplicationController
	def index
		@answers = Answer.all
	end

	def new
		@answer = Answer.new
		@question = Question.find(params[:question_id])
	end

	def create
		@question = find_question
		@answer = current_user.answers.create(body: 
			params[:answer][:body], question_id: @question.id)
		if @answer.save
			redirect_to question_path(@question)
		else
			render :action => 'new'
		end
	end

	def edit
		@answer = Answer.find(params[:id])
	end

	def show
		@answer = Answer.find(params[:id])
	end

	def destroy 
		@answer = Answer.find(params[:id])
		@answer.destroy
	end

  def upvote
	@question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.upvote_from current_user
    redirect_to @question
  end

  def downvote
  	@question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.downvote_from current_user
    redirect_to @question
  end

	private

	def find_question
		params.each do |name, value|
			if name =~ /(.+)_id$/
				return $1.classify.constantize.find(value)
			end
		end
		nil
	end

end