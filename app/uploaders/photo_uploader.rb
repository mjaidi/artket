class PhotoUploader < CarrierWave::Uploader::Base
 include Cloudinary::CarrierWave

version :cards do
  resize_to_fit 500, 500
end

version :banner do
  resize_to_fit 1250, 750
end
end
