require "administrate/base_dashboard"

class AdminUserDashboard < Administrate::BaseDashboard
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
  id
  email
  ].freeze
  
  SHOW_PAGE_ATTRIBUTES = %i[
  posts
  id
  email
  phone
  first_name
  last_name
  sign_in_count
  current_sign_in_at
  last_sign_in_at
  current_sign_in_ip
  last_sign_in_ip
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
  type
  ].freeze
  
  COLLECTION_FILTERS = {}.freeze
  
  # Overwrite this method to customize how admin users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(admin_user)
  #   "AdminUser ##{admin_user.id}"
  # end
end
