require 'test_helper'

class LearningMailer::SampleMailerTest < ActionMailer::TestCase
  test "t1" do
    mail = LearningMailer::SampleMailer.t1
    assert_equal "T1", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "t2" do
    mail = LearningMailer::SampleMailer.t2
    assert_equal "T2", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "t3" do
    mail = LearningMailer::SampleMailer.t3
    assert_equal "T3", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "t4" do
    mail = LearningMailer::SampleMailer.t4
    assert_equal "T4", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
