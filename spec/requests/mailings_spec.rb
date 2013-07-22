require 'spec_helper'

describe 'images in emails', :js => true do

  before do
    ActionMailer::Base.deliveries = []
  end

  it "eager images should appear normally" do
    visit send_mail_mailings_path

    mail = ActionMailer::Base.deliveries.first
    mail.body.should_not =~ /class=".*lazy.*"/
  end
end
