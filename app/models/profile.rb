class Profile < ActiveRecord::Base
  belongs_to :user  
  has_attached_file :photo
  #do_not_validate_attachment_file_type :photo
  validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
