class ViewTestController < ApplicationController
  def t1
    @book = Book.new()
    @allBook = Book.all()
    @spBook = Book.find(params[:title], 1)#改訂新版JavaScript本格入門
    @allQusetionnaire = Questionnaire.all
  end

  def t2
  end

  def t3
  end

  def t4
  end

  def t5
  end

  def t6
  end
end
