
require "image_processing/mini_magick"

class ImageUploader < Shrine
  # plugins and uploading logic

  include ImageProcessing::MiniMagick
  plugin :processing

  process(:store) do |io, context|
    resize_to_limit!(io.download, 800, 800) { |cmd| cmd.auto_orient } # orient rotated images
  end
end
