class ControllerTestController < ApplicationController
  def t1
    @headers = request.headers
    @email = defined?(cookies[:email]) ? cookies[:email] : ''
    #@email = defined?(session[:email]) ? session[:email]["value"] : ''

  end

  def t2
    @headers = request.headers
    email = params[:email]
    if defined?(email)&& email != ''
      cookies[:email] = {value: email, expires: 1.months.from_now}
      #session[:email] = email
      @result = "your email: #{email}"
    else
      @result = "please write your email address"
    end
  end

  def t3 #update file
    #render 'controller_test/t5'
    #render action: 't5'
    #return
    upload = params[:upload]
    @result = ""
    @uploaded = false
    if defined?(upload) && upload != nil
      name = upload.original_filename
      permissions = ['.mp4', '.mp3', '.swift', '.rb', '.cpp', '.jpeg']

      if !permissions.include?(File.extname(upload.original_filename).downcase)
        @exname = File.extname(upload.original_filename).downcase
        @result = "file's extname not allowed #{@exname}"
      elsif upload.size > 128.megabyte
        @result = "size is over limit: 1mb"
      else
        File.open("/Users/xuweida/Desktop/github/Learning-Ruby/File/#{name}", 'wb') do |file|
          #File.write(file, File.read(upload.original_filename))
          file.print(upload.read)
        end
        @uploaded = true
        @result = "successfully create #{name}"
      end
    else
      @result = "please choose your file"
    end
  end

  def t4
    #render xml
    @test = ModelTest.all#.where('hp > :hp AND israre = :rare', :rare => true, hp: 1000)
    @modeltest1 = Modeltest1.all
    @modeltest2 = Modeltest2.all
    render :xml => @test+@modeltest1+@modeltest2
    #render xml: 'test'

  end

  def t5
    #render json
    @test = ModelTest.all#.where('hp > :hp AND israre = :rare', :rare => true, hp: 1000)
    @modeltest1 = Modeltest1.all
    @modeltest2 = Modeltest2.all
    render :json => @test+@modeltest1+@modeltest2
  end

  def t6
    send_file '/Users/xuweida/Desktop/github/Learning-Ruby/File/IMG_6680.JPG', disposition: :inline
  end

  def t7 #download
    # send _file send_data
    send_file '/Users/xuweida/Desktop/github/Learning-Ruby/File/ExString.swift'#, disposition: :inline#, status: :unauthorized#:not_found
  end

  def t8
    num = 100
    render plain: %Q(<div style="color:Red;">test #{num}</div>)
  end

  def t9
    num = 100
    render html: %Q(<div style="color:Red;">test #{num}</div>).html_safe
  end

  def t10
    #head 500
  end
end
