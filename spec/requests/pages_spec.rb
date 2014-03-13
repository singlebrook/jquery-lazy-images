require 'spec_helper'

describe 'basic lazy image loading', :js => true do
  it "should load the Javascript from the plugin" do
    visit basic_pages_path
    page.should have_css 'img[data-original]'
  end

  it "should load the real image only when the user scrolls to it" do
    visit basic_pages_path

    page.should have_css 'img[src*="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXYzh8+PB/AAffA0nNPuCLAAAAAElFTkSuQmCC"]'
    page.should_not have_css 'img[src*="placekitten"]'

    page.evaluate_script("scrollTo(0, 1000000)");
    page.should have_css 'img[src*="placekitten"]'
    page.should_not have_css 'img[src*="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXYzh8+PB/AAffA0nNPuCLAAAAAElFTkSuQmCC"]'
  end

  it "should load multiple images" do
    visit multiple_pages_path
    page.should have_css 'img[src*="placekitten"]', count: 2
  end

  describe 'without javascript', driver: :rack_test do
    it "should display images" do
      visit basic_pages_path
      page.should have_css 'noscript img[src*="placekitten"]'
    end

    it "should not display placeholder images" do
      visit basic_pages_path
      # I'd like to check the visibility, but RackTest doesn't even parse CSS...
      # page.find('img[src*="DataUriGoesHere"]').should_not be_visible
      # So instead I'll just check that it has the "lazy" class, which is hidden
      # via CSS.
      page.should have_css 'img.lazy[src*="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXYzh8+PB/AAffA0nNPuCLAAAAAElFTkSuQmCC"]'
    end
  end
end
