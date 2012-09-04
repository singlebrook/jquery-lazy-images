require 'spec_helper'

describe 'basic lazy image loading' do
  it "should load the Javascript from the plugin" do
    visit basic_pages_path
    binding.pry
    response.should be_success
  end
end