# by just writing the model name and that it inherits from active record, that's all it takes for you to have a model that is totally ready to deal with the db
# by creating a model it gives you setters and getters access to all attributes in table
class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end