# Canvas model
# The structure for the canvas business model representation
# Author::    Yerko Palma  (mailto:yerko.palma@usach.cl)
class Canvas
  include Mongoid::Document
  include Mongoid::EmbeddedErrors

  validate :description_and_tags_present, :descriptions_must_be_strings,
            :tags_should_be_non_empty_string_arrays, :uniq_tags

  field :key_partners, type: Hash
  field :key_activities, type: Hash
  field :key_resources, type: Hash
  field :value_propositions, type: Hash
  field :customer_relationships, type: Hash
  field :channels, type: Hash
  field :customer_segments, type: Hash
  field :cost_structures, type: Hash
  field :revenue_streams, type: Hash

  validates :key_partners, presence: true
  validates :key_activities, presence: true
  validates :key_resources, presence: true
  validates :value_propositions, presence: true
  validates :customer_relationships, presence: true
  validates :channels, presence: true
  validates :customer_segments, presence: true
  validates :cost_structures, presence: true
  validates :revenue_streams, presence: true

  def description_and_tags_present
    self.attributes.each do |prop, value|
      if prop != '_id' && !value.nil?
        if !value.has_key? :description 
          errors.add(prop, 'Must have a description field')
        end

        if value[:description].nil?
          errors.add(prop, 'Description can not be nil')
        end

        if !value.has_key? :tags || value[:tags].nil?
          errors.add(prop, 'Must have a tags field')
        end

        if value[:tags].nil?
          errors.add(prop, 'Tags can not be nil')
        end
      end
    end
  end

  def descriptions_must_be_strings
    self.attributes.each do |prop, value|
      if prop != '_id' && !value.nil?
        if !value[:description].instance_of? String
          errors.add(prop, 'description must be a string')
        end
      end
    end
  end

  def tags_should_be_non_empty_string_arrays
    self.attributes.each do |prop, value|
      if prop != '_id' && !value.nil?
        if !value[:tags].instance_of? Array
          errors.add(prop, 'tags must be Array')
        else
          if !value[:tags].any?
            errors.add(prop, "tags can not be empty")
          else
            value[:tags].each do |tag|
              if !tag.instance_of? String
                errors.add(prop, "must have only string tags")
              end
            end
          end
        end
      end
    end
  end

  def uniq_tags
    self.attributes.each do |prop, value|
      if prop != '_id' && !value.nil?
        if value[:tags].instance_of? Array
          if !(value[:tags].uniq.length == value[:tags].length)
            errors.add(prop, "must have unique tags")
          end
        end
      end
    end
  end
  embedded_in :idea, class_name: 'Idea', inverse_of: :canvas
end
