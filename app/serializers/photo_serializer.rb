class PhotoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :image_url, :caption
  belongs_to :family
end
