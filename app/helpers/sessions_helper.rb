module SessionsHelper
    # 渡されたユーザーがログイン済みユーザーであればtrueを返す
  def current_customer?(customer)
    customer == current_customer
  end

end