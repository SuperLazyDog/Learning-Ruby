class ControllerTestController < ApplicationController
  def t1
    @headers = request.headers
  end

  def t2
    @headers = request.headers
  end

  def t3 #update file
    #render 'controller_test/t5'
    #render action: 't5'
    #return
    upload = params[:upload]
    @result = ""
    name = upload.original_filename
    permissions = ['.mp4', '.mp3', '.swift', '.rb', '.cpp']

    if false#!permissions.include?(File.extname(upload).downcase)
      @result = "file's extname not allowed"
    elsif upload.size > 128.megabyte
      @result = "size is over limit: 1mb"
    else
      File.open("/Users/xuweida/Desktop/github/Learning-Ruby/File/#{name}", 'wb') do |file|
        #File.write(file, File.read(upload.original_filename))
        file.write(upload.read)
      end
      @result = "successfully create #{name}"
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
    num = 100
    render plain: %Q(<div style="color:Red;">test #{num}</div>)
  end

  def t9
    num = 100
    render html: %Q(<div style="color:Red;">test #{num}</div>).html_safe
  end

  def t10
    head 500
  end
end
