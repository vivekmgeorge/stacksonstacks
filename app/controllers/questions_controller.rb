class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @question = Question.new
  end

  def show
  	@question = Question.find(params[:id])
    @comments = @question.comments
  end

  def new
  	@question = Question.new
  end

  def edit
  	@question = Question.find(params[:id])
  end

 def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to question_path(@question)
    else
      render 'edit'
    end
  end


  def create
    # Using current_user and #create/#build to add a question
    # to the current user's array of questions
  	@question = current_user.questions.create(question_params)
    redirect_to question_path(@question)
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path
  end

  def upvote
    @question = Question.find(params[:id])
    @question.upvote_from current_user
    redirect_to question_path(@question)
  end

  def downvote
    @question = Question.find(params[:id])
    @question.downvote_from current_user
    redirect_to question_path(@question)
  end

  private

  def question_params
  	params.require(:question).permit(:title, :body)
  end
end

