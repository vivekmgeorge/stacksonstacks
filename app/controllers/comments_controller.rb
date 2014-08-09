class CommentsController < ApplicationController
	def index
		@commentable = find_commentable
		@comments = @commentable.comments
	end

	def show
		@comment = Comment.find(params[:id])
	end

	def new
		@comment = Comment.new
	end

	def create
		@commentable = find_commentable
		@comment = @commentable.comments.build(comment_params)
		if @comment.save
		  flash[:notice] = "Successfully created comment."
		  redirect_to :id => nil
		else
		  render :action => 'new'
		end
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to comments_path 
	end

	private

	def comment_params
		params.require(:comment).permit(:body)
	end

	def find_commentable
	  params.each do |name, value|
	    if name =~ /(.+)_id$/
	      return $1.classify.constantize.find(value)
	    end
	  end
	  nil
	end
end
