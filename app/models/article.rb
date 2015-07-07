class Article < ActiveRecord::Base
  acts_as_taggable

  has_attached_file :image, :styles => { normal: "700x500", :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  belongs_to :user

  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end

  def self.search(search)
    if search
      where(['title LIKE ?', "%#{search}%"])
    else
      all
    end
  end

end
