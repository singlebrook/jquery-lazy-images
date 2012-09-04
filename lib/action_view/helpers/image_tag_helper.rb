module ActionView
  module Helpers

    def image_tag_with_laziness(source, options={})
      options = options.symbolize_keys

      options[:data] = {original: path_to_image(source)}

      image_tag_without_laziness('grey.gif', options)
    end

    alias_method_chain :image_tag, :laziness

  end
end