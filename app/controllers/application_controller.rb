class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  # paramsハッシュ（？）からユーザーを取得。要はここで@userを定義しちゃおうと。色々便利だから。
  def set_user
    @user = User.find(params[:id])
  end

  # ログイン済みのユーザーか確認。
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
    end
  end

  # アクセスしたユーザー＝現在ログインしているユーザー　かどうか確認
  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end

  # システム管理権限所有かどうか判定する。
  # これないとコマンドラインからDELETEリクエストを直接発行するという攻撃方法でユーザーを全て削除してしまうことも可能らしい。
  def admin_user
    redirect_to root_url unless current_user.admin?
  end
  
    # @userが定義されている上で使用する（？）
  def admin_or_correct
    unless current_user?(@user) || current_user.admin?
      flash[:danger] = "権限がありません。"
      redirect_to root_url
    end  
  end

end


 