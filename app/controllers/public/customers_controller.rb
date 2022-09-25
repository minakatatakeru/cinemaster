class Public::CustomersController < ApplicationController

  require 'themoviedb-api'
  Tmdb::Api.key("d6599ce988e5da53192a7a5539607824")
  # 映画情報の表示の際の言語設定を日本語にする
  Tmdb::Api.language("ja")

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
       redirect_to customer_path, notice: "You have updated user successfully."
    else
       render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
       redirect_to customer_path, notice: "You have updated user successfully."
    else
       render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :profile_image)
  end

end

