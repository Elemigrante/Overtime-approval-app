require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  
  ATTRIBUTE_TYPES = {
    posts: Field::HasMany.with_options(searchable: false),
    id: Field::Number.with_options(searchable: false),
    email: Field::String.with_options(searchable: true),
    password: Field::String.with_options(searchable: false),
    sign_in_count: Field::Number.with_options(searchable: false),
    current_sign_in_at: Field::DateTime.with_options(searchable: false),
    last_sign_in_at: Field::DateTime.with_options(searchable: false),
    current_sign_in_ip: Field::String.with_options(searchable: false),
    last_sign_in_ip: Field::String.with_options(searchable: false),
    first_name: Field::String.with_options(searchable: false),
    last_name: Field::String.with_options(searchable: false),
    created_at: Field::DateTime.with_options(searchable: false),
    updated_at: Field::DateTime.with_options(searchable: false),
    type: Field::String.with_options(searchable: false),
    phone: Field::String.with_options(searchable: false)
  }.freeze
  
  COLLECTION_ATTRIBUTES = %i[
  posts
  email
  type
  ].freeze
  
  SHOW_PAGE_ATTRIBUTES = %i[
  posts
  email
  phone
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
  phone
  ].freeze
  
  COLLECTION_FILTERS = {}.freeze
  
  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
