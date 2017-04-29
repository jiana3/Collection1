class Post < ActiveRecord::Base
  # Relationship
  belongs_to :user

  # Posts can have tags
  acts_as_taggable

end
