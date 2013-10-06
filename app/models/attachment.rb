class Attachment < ActiveRecord::Base
  has_attached_file :attach, :default_url => "public/attachment/",  :path => "public/files/:id/:filename"

  validates_attachment_content_type :attach, :content_type => ['image/jpeg', 'image/jpg', 'image/png']
end
