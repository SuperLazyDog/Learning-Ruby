class TestController < ApplicationController
  # TODO: weida note: 发送邮件测试
  def t1
    mail = LearningMailer::SampleMailer.t1
    mail.deliver_now
    # render plain: "还没出啊兄弟😂"
    render plain: "测试邮件已送出"
  end

  def t2
    render plain: "还没出啊兄弟😂"
  end

  def t3
    render plain: "还没出啊兄弟😂"
  end

  def t4
    render plain: "还没出啊兄弟😂"
  end

  def t5
    render plain: "还没出啊兄弟😂"
  end
end
