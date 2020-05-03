require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  
  ATTRIBUTE_TYPES = {
    posts:      Field::HasMany,
    id:         Field::Number,
    email:      Field::String,
    password:   Field::String,
    first_name: Field::String,
    last_name:  Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    type:       Field::String
  }.freeze
  
  COLLECTION_ATTRIBUTES = %i[
  posts
  id
  email
  type
  ].freeze
  
  SHOW_PAGE_ATTRIBUTES = %i[
  posts
  id
  email
  first_name
  last_name
  created_at
  updated_at
  type
  ].freeze
  
  FORM_ATTRIBUTES = %i[
  email
  password
  first_name
  last_name
  ].freeze
  
  COLLECTION_FILTERS = {}.freeze
  
  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
