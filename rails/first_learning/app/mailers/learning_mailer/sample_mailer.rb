class LearningMailer::SampleMailer < ApplicationMailer
  default to: "xu.ywwt.a1@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.learning_mailer.sample_mailer.t1.subject
  #
  def t1
    @greeting = "Hi"
    mail
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.learning_mailer.sample_mailer.t2.subject
  #
  def t2
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.learning_mailer.sample_mailer.t3.subject
  #
  def t3
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.learning_mailer.sample_mailer.t4.subject
  #
  def t4
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
