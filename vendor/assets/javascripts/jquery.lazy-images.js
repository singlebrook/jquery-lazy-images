//=require jquery.lazyload

$(window).load(lazy_load_images);

function lazy_load_images() {
  $("img.lazy").show().lazyload();
}