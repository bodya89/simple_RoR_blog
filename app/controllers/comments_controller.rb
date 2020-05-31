class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:user_info, :data))
		redirect_to post_path(@post)
	end
	def destroy 
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end
	def update
	    # respond_to do |format|
	    #   	@post = Post.find(params[:post_id])
	    #   	@comment = @post.comments.find(params[:id])
	    #   	@comment.edit
	    #   	redirect_to post_path(@post)
     #  	end
     	if @comment.update(comment_params)
          format.html { redirect_to @comment, notice: 'Post was successfully updated.' }
          format.json { render :show, status: :ok, location: @comment }
        else
          format.html { render :edit }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
    end
    def show
    end
  
end
