require 'test_helper'

class MailerTest < ActionMailer::TestCase
  test "success" do
    mail = Mailer.success
    assert_equal "Success", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "failure" do
    mail = Mailer.failure
    assert_equal "Failure", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
