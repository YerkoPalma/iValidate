class Canvas
  include Mongoid::Document
  
  field :key_partners, type: Hash
  field :key_activities, type: Hash
  field :key_resources, type: Hash
  field :value_propositions, type: Hash
  field :customer_relationships, type: Hash
  field :channels, type: Hash
  field :customer_segments, type: Hash
  field :cost_structures, type: Hash
  field :revenue_streams, type: Hash
  
  embedded_in :idea, class_name: "Idea", inverse_of: :canvas
  
end
