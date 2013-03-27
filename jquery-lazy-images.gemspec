$:.push File.expand_path("../lib", __FILE__)

require "jquery-lazy-images/version"

Gem::Specification.new do |s|
  s.name        = "jquery-lazy-images"
  s.version     = JqueryLazyImages::VERSION
  s.authors     = ["Singlebrook Technology"]
  s.email       = ["leon@singlebrook.com"]
  s.homepage    = "https://github.com/singlebrook/jquery-lazy-images"
  s.summary     = "Load all images in your Rails app lazily (i.e. only when they are visible)."
  s.description = "Why make the browser load images that the user isn't going to see?
    This Rails engine prevents images from loading until they're actually going to be displayed.
    This saves bandwidth, reduces server load, and helps the user stay under their data quota."

  s.files = Dir["{app,config,db,lib,vendor}/**/*"] + ["MIT-LICENSE", "Rakefile"]

  s.add_dependency "rails", "~> 3.1"

  s.post_install_message = "If you use image_tag in your email templates, please change it to
    eager_image_tag. If you don't, your email messages WILL LOOK WRONG!
    This DANGEROUS command might make those changes for you:
      sed -i 's/image_tag/eager_image_tag/g' app/views/*_mailer/*
    "

  s.add_development_dependency "capybara"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-spork"
  s.add_development_dependency "poltergeist"
  s.add_development_dependency "rb-fsevent"
  s.add_development_dependency "rspec-rails"
end
