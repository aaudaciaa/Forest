class UsersController < ApplicationController
  def signup
  end

  def register
    User.create(
      email: params[:email],
      password: params[:password]
    )
    
    redirect_to '/'
  end

  def login
  end

  def login_session
    user = User.find_by(email: params[:email])
    if user
      if user.password == params[:password]
        session[:user_id] = user.id
        flash[:notice] = "#{user.email}님 환영합니다."
        redirect_to '/'
      else
        flash[:alert] = "비밀번호가 틀렸습니다."
        redirect_to '/users/login'
      end
    else
      flash[:alert] = "입력하신 이메일에 대한 정보가 없습니다."
      redirect_to '/users/signup'
    end
  end

  def logout
    session.clear
    flash[:notice] = "로그아웃 되었습니다."
    redirect_to '/'
  end
  
  def lol
    @users = User.all
  end
end
