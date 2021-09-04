# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

#this code bey5ally en lama input yeb2a 3aleh validation error mayet3melsh el div el zyada bta3et el validation
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.html_safe
end
