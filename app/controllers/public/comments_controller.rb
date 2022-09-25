class Public::CommentsController < ApplicationController
  def create
    @comment = current_customer.comments.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)  #コメント送信後は、一つ前のページへリダイレクトさせる。
    else
      redirect_back(fallback_location: root_path)  #同上
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
       redirect_to customer_path(@comment.customer_id), notice: "You have updated user successfully."
    else
       render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to customer_path(@comment.customer_id), notice: "You have updated user successfully."
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content, :movie_id, :moviedata_id, :star, :title)  #formにてmovie_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end
end
