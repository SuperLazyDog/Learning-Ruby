# Preview all emails at http://localhost:3000/rails/mailers/learning_mailer/sample_mailer
class LearningMailer::SampleMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/learning_mailer/sample_mailer/t1
  def t1
    LearningMailer::SampleMailer.t1
  end

  # Preview this email at http://localhost:3000/rails/mailers/learning_mailer/sample_mailer/t2
  def t2
    LearningMailer::SampleMailer.t2
  end

  # Preview this email at http://localhost:3000/rails/mailers/learning_mailer/sample_mailer/t3
  def t3
    LearningMailer::SampleMailer.t3
  end

  # Preview this email at http://localhost:3000/rails/mailers/learning_mailer/sample_mailer/t4
  def t4
    LearningMailer::SampleMailer.t4
  end

end
