class Idea
  include Mongoid::Document
  #include Mongoid::Paperclip
  
  field :name, type: String
  field :description, type: String
  field :contact, type: String
  field :avatar, type: String
  field :tags, type: Array
  
  #has_mongoid_attached_file :avatar, default_url: ActionController::Base.helpers.asset_path('http://placehold.it/230x150')
  #validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
