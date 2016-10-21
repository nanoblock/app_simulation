class Image < ActiveRecord::Base
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  validates_attachment :photo, 
    presence: true, #file save check
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] },
    less_than: 3.megabytes

end
