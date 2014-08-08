class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
  	@question = Question.find(params[:id])
  end

  def new
  	@question = Question.new
  end

  def edit
  	
  end

  def create
  	@question = Question.new(question_params)
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
  	params.require(:question).permit(:title, :body)
  end
end

