require 'spec_helper'

describe 'basic lazy image loading' do
  it "should load the Javascript from the plugin" do
    visit basic_pages_path
    page.source.should have_selector 'img[data-original]'
  end
end