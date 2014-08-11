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
		@question = find_question
		@answer = Answer.find(params[:id])
	end

	def update
		@question = find_question
		@answer = Answer.find(params[:id])
		if @answer.update(answer_params)
			redirect_to @question
		else
			render :edit
		end
	end

	def show
		@answer = Answer.find(params[:id])
	end

	def destroy
		@question = find_question
		@answer = Answer.find(params[:id])
		@answer.destroy# if current_user.id == @answer.user_id
		redirect_to question_path(@question)
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
	def answer_params
		params.require(:answer).permit(:body)
	end

	def find_question
		params.each do |name, value|
			if name =~ /(.+)_id$/
				return $1.classify.constantize.find(value)
			end
		end
		nil
	end

end