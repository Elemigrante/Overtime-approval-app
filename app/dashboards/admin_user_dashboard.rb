require "administrate/base_dashboard"

class AdminUserDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    posts:      Field::HasMany,
    id:         Field::Number,
    email:      Field::String,
    password:   Field::String,
    first_name: Field::String,
    last_name:  Field::String,
    sign_in_count: Field::Number.with_options(searchable: false),
    current_sign_in_at: Field::DateTime.with_options(searchable: false),
    last_sign_in_at: Field::DateTime.with_options(searchable: false),
    current_sign_in_ip: Field::String.with_options(searchable: false),
    last_sign_in_ip: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    type:       Field::String
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
