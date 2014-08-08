class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to category_post_path(@post.category_id, @post)
    else
      render 'edit'
    end
  end

  def create

  end

  def new
  end
end


#######

# def edit
#     @category = Category.find(params[:category_id])
#     @post = Post.find(params[:id])
#   end

#   def update
#     @post = Post.find(params[:id])

#     if @post.update(post_params)
#       redirect_to category_post_path(@post.category_id, @post)
#     else
#       render 'edit'
#     end
#   end

#   def new
#     @category = Category.find(params[:category_id])
#     @post = Post.new
#   end

#   def create
#     @category = Category.find(params[:category_id])
#     @post = @category.posts.create(post_params)
#     redirect_to category_post_path(@post.category_id, @post)
#   end

#   def destroy
#     @category = Category.find(params[:category_id])
#     Post.find(params[:id]).destroy
#     redirect_to category_path(@category)
#   end

#   private

#   def post_params
#     params.require(:post).permit(:title, :description, :email, :price)
#   end

