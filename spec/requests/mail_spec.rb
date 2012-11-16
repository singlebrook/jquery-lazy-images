require 'spec_helper'

describe 'images in emails' do

  before do
    ActionMailer::Base.deliveries = []
  end

  it "eager images should appear normally" do
    visit send_mail_mail_path

    mail = ActionMailer::Base.deliveries.first
    mail.body.should_not have_selector 'img.lazy'
  end
end