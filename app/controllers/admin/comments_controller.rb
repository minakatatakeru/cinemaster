class Admin::CommentsController < ApplicationController
   before_action :authenticate_customer!
   before_action :if_not_admin
 　 before_action :set_comment, only: [:index, :new, :create, :show, :edit, :destroy]

def index
   @comments = Comment.all
end

def destroy
    Comment.find(params[:id]).destroy
    flash[:success] = "Comment deleted"
    redirect_to commnets_path
end

 private
　def if_not_admin
　   redirect_to root_path unless current_customer.admin?
　end

  def set_comment
　　 @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment_content, :movie_id, :moviedata_id, :star, :title)  #formにてmovie_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end

end
