To-do
=======

* Allow user to specify that certain images should be eager-loaded
* Supply noscript version so that JS-less browsers can still see images
* Allow custom placeholder
* Expose various options in jquery.lazyload.js (or just tell user to require lazyload instead of lazyload-rails)
* Rip out unused parts of Rails from dummy app (ActiveRecord, ActionMailer, etc)
* Test multiple images on a page
* Test whether other image helpers are using image_tag under the hood.
* Provide attribution to author of jquery.lazyload.js
* Add support for Rails 3.0 and below (by adding generator that copies assets into project)
* Switch to capybara-webkit for testing