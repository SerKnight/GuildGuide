require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    roles: Field::HasMany,
    sent_messages: Field::HasMany.with_options(class_name: "Message"),
    received_messages: Field::HasMany.with_options(class_name: "Message"),
    user_journeys: Field::HasMany,
    journeys: Field::HasMany,
    id: Field::Number,
    guild_id: Field::String,
    first_name: Field::String,
    last_name: Field::String,
    phone: Field::String,
    email: Field::String,
    opted_out: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :roles,
    :sent_messages,
    :received_messages,
    :user_journeys,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :roles,
    :sent_messages,
    :received_messages,
    :user_journeys,
    :journeys,
    :id,
    :guild_id,
    :first_name,
    :last_name,
    :phone,
    :email,
    :opted_out,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :roles,
    :sent_messages,
    :received_messages,
    :user_journeys,
    :journeys,
    :guild_id,
    :first_name,
    :last_name,
    :phone,
    :email,
    :opted_out,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(user)
    "#{user.first_name} #{user.last_name}"
  end
end
