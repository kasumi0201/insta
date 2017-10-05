require "image_processing/mini_magick"

class ImageUploader < Shrine
    include ImageProcessing::MiniMagick
    plugin :processing
    plugin :versions
    # plugin :cached_attachment_data
    # plugin :remove_attachment
    # plugin :delete_raw
    # other code...

    process(:store) do |io, context|
      original = io.download

      size_800 = resize_to_limit!(original, 800, 800) { |cmd| cmd.auto_orient } # orient rotated images
      size_500 = resize_to_limit(size_800,  500, 500)
      size_300 = resize_to_limit(size_500,  300, 300)

      {original: io, large: size_800, medium: size_500, small: size_300}
    end
end
