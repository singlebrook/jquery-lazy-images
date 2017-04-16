module ActionView
  module Helpers
    module AssetTagHelper

      def image_tag_with_laziness(source, options={})
        options = options.symbolize_keys
        orig_options = options.dup

        options[:data] ||= {}
        options[:data][:original] = path_to_image(source)
        options[:class] ||= ""
        options[:class] << " lazy"

        output = image_tag_without_laziness('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXYzh8+PB/AAffA0nNPuCLAAAAAElFTkSuQmCC', options)
        output << content_tag('noscript', image_tag_without_laziness(source, orig_options))
      end

      alias_method :eager_image_tag, :image_tag
      alias_method_chain :image_tag, :laziness
    end
  end
end
