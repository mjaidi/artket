class PhotoUploader < CarrierWave::Uploader::Base
 include Cloudinary::CarrierWave

version :cards do
  cloudinary_transformation :width=>500, :crop=>"scale"
end

version :banner do
  cloudinary_transformation :width=>2000, :crop=>"scale"
end
end
