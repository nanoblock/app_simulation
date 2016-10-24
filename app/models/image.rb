class Image < ActiveRecord::Base
  has_many :ocrs, dependent: :destroy
  has_many :clickables, dependent: :destroy

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  Paperclip.interpolates :id_sha1  do |attachment, style|
    Digest::SHA1.hexdigest(attachment.instance.id.to_s)
  end

  has_attached_file :photo, 
  styles: { original: "400x650!", medium: "400x650!", thumb: "120x180!" }, #, thumb: "400x650!"
  path: ":rails_root/public/images/:id_sha1/:style.:extension", #upload server image path
  url: "/images/:id_sha1/:style.:extension"
  

  validates_attachment :photo, 
    presence: true, #file save check
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] },
    less_than: 3.megabytes

end
