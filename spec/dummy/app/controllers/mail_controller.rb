class MailController < ApplicationController
  def send_mail
    SimpleMailer.sample_message.deliver
    render text: 'Message sent'
  end
end