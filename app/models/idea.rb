# Idea model
# Author::    Yerko Palma  (mailto:yerko.palma@usach.cl)
class Idea
  include Mongoid::Document

  validate :only_string_tags, :uniq_tags

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_BASE64_REGEX = /\A(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=)?\z/
  VALID_IMG_SOURCE = /\A.*\.(jpg|JPG|gif|GIF|png|PNG)\z/
  DEFAULT_AVATAR = 'http://placehold.it/230x150'

  field :name, type: String
  field :description, type: String
  field :contact, type: String
  field :avatar, type: String
  field :tags, type: Array
  field :_id, type: String, default: -> { name }

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :contact, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :avatar, format: { with: VALID_BASE64_REGEX }, unless: :valid_img_source?

  embeds_one :canvas, class_name: 'Canvas', inverse_of: :idea

  def valid_img_source?
    (VALID_IMG_SOURCE =~ self.avatar) == 0 || self.avatar == DEFAULT_AVATAR
  end

  def only_string_tags
    if !tags.nil?
      tags.each do |tag|
        if !tag.is_a? String
          errors.add(:tags, 'Must contain only strings')
        end
      end
    end
  end

  def uniq_tags
    if !tags.nil?
      if tags.uniq.length != tags.length
        errors.add(:tags, 'Can not add repeated tags')
      end
    end
  end

end
