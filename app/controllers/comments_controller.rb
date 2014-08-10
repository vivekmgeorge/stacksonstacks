class CommentsController < ApplicationController
	def index
		# @commentable = find_commentable
		# @comments = @commentable.comments
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
		  redirect_to root_path
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
		puts params
		puts "before loops"
	  params["comment"].each do |name, value|
	    if name =~ /(.+)_id$/
	    	p $1
	    	p $1.classify.constantize
	    	p value.to_i
	      return $1.classify.constantize.find(value.to_i)
	    end
	  end
	  puts "after loop"
	  nil
	end
end
