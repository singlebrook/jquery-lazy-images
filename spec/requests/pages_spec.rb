require 'spec_helper'

describe 'basic lazy image loading' do
  it "should load the Javascript from the plugin" do
    visit basic_pages_path
    page.source.should have_selector 'img[data-original]'
  end

  it "should load the real image only when the user scrolls to it" do
    visit basic_pages_path

    page.source.should have_selector 'img[src*="grey.gif"]'
    page.source.should_not have_selector 'img[src*="placekitten"]'

    page.evaluate_script("scrollTo(0, 1000000)");
    page.source.should have_selector 'img[src*="placekitten"]'
    page.source.should_not have_selector 'img[src*="grey.gif"]'
  end

  it "should load multiple images" do
    visit multiple_pages_path

    page.source.should have_selector 'img[src*="placekitten"]', count: 2
  end
end
