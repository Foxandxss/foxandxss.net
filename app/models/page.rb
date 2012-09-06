class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  attr_accessible :content, :image, :title, :category, :slug, :category_id, :informations, :informations_attributes, :images_attributes, :links_attributes

  belongs_to :category, class_name: "PageCategory"
  has_many :informations, class_name: "PageInformation"
  has_many :links, class_name: "PageLink"
  has_many :images, class_name: "PageImage"

  accepts_nested_attributes_for :informations, allow_destroy: true
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :links, allow_destroy: true

  validates :title, :content, presence: true

  # We let the user create a custom slug, but friendly_id have to check it before
  def normalize_friendly_id(string)
    if slug.blank?
      super
    else
      super(slug)
    end
  end
end
