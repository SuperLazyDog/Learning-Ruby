class LoginController < ApplicationController
  #预处理，检查
  #before_action :login
  include Login

  def t1  #登陆

  end

  def t2 #登录验证
    @username = params[:username]
    @password = params[:password]
    @referer = params[:referer]
    @user = Login.find_by(user: @username)
    if  @user && @user.authenticate(@password)
      #render plain: 'OK'
      @result = "登录成功😊 "
      @headers = request.headers
      render template: 'controller_test/t1'
      #保存登录状态
      reset_session
      session[:user] = @user.password_digest
      # TODO: 登录状态 session, flash p386~389
    else
      #render plain: 'NO'
      @result = "登录失败😭 "
    end
  end

  def t3 #注册
    @username = params[:username]
    @password = params[:password]
    @referer = params[:referer]
    @user = Login.new(:user => @username, :password_digest => BCrypt::Password.create(@password))
    if @user.save
      @result = "注册成功😊 "

      render action: :t1
      #redirect_to params[:referer]
      #render plain: 'created'
    else
      @result = "注册失败😭 "
      flash.now[:referer] = params[:referer]
      #render plain: 'failed'
    end
  end

  def t4
  end

  def t5
  end

  def t6
  end

  def t7
  end

  def t8
  end

  def t9
  end

  def t10
  end
=begin
  private
    def login

    end
=end
end
