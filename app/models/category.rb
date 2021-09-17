class Category < ApplicationRecord
  # we will put the presence validation on the name field to make the test pass in the category_test file
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }

  # name can not have duplicates with the same name twice
  validates_uniqueness_of :name
end