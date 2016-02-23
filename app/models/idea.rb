# Idea model
# Author::    Yerko Palma  (mailto:yerko.palma@usach.cl)
class Idea
  include Mongoid::Document

  field :name, type: String
  field :description, type: String
  field :contact, type: String
  field :avatar, type: String
  field :tags, type: Array
  field :_id, type: String, default: -> { name }

  validates :name, presence: true
  validates :contact, presence: true

  embeds_one :canvas, class_name: 'Canvas', inverse_of: :idea
end
