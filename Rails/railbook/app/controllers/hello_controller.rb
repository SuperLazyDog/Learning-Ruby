class HelloController < ApplicationController
  def show
    @msg = "??"
  end
  def view
    @msg1 = "网页开发到底是什么鬼。"
    @msg2 = "html和css完全用不上啊，之前白学了"
    @msg3 = "虽然是在公司拿钱学的😂"
  end
  def index
    render plain: "我是个逗比"
  end
end
