
       redirect_to customer_path, notice: "You have updated user successfully."
    else
       render :edit
    end
  end

  def destroy
    # @comment = Comment.find(params[:id])
    # if @comment.destroy
    #   redirect_to customer_path, notice: "You have updated user successfully."
    # else
    #   render :edit
    # end

    Customer.find(params[:id]).destroy
    flash[:success] = "Customer deleted"
    redirect_to customers_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :profile_image)
  end

  # 管理者かどうか確認
  def admin_customer
      redirect_to(root_path) unless current_customer.admin?
  end

end

