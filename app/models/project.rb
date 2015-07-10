class Project < ActiveRecord::Base
  belongs_to :user
  has_attached_file :logo, :styles => { :medium => "250x150>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

end
