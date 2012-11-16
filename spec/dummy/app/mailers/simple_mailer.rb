class SimpleMailer < ActionMailer::Base
  default from: "from@example.com"

  def sample_message
    mail to: 'to@example.com'
  end
end
