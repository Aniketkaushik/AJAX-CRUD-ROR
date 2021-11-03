class CommentsController < ApplicationController

    def index
        @comments = comment.all
    end

    def create 
        @comment = current_user.comments.new(comment_params)
        if !@comment.save 
            flash[:notice] = @comment.errors.full_messages.to_sentence
        end 

        redirect_to task_path(params[:task_id])
    end 

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])
        respond_to do |format|
          if @comment.update(comment_params)
            format.js {}
            format.html { redirect_to  notice: "Task was successfully updated." }
            format.json { render :show, status: :ok, location: @comment}
          else
            format.js {}
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @comment.errors, status: :unprocessable_entity }
          end
        end
    end
    
    private

  

    def comment_params
        params
            .require(:comment)
            .permit(:content)
            .merge(task_id: params[:task_id])
    end 



end
