require "administrate/base_dashboard"

class MessageDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    sender: Field::BelongsTo.with_options(class_name: "User"),
    receiver: Field::BelongsTo.with_options(class_name: "User"),
    id: Field::Number,
    body: Field::Text,
    sender_id: Field::Number,
    receiver_id: Field::Number,
    from: Field::String,
    to: Field::String,
    type: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :sender,
    :receiver,
    :id,
    :body,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :sender,
    :receiver,
    :id,
    :body,
    :sender_id,
    :receiver_id,
    :from,
    :to,
    :type,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :sender,
    :receiver,
    :body,
    :sender_id,
    :receiver_id,
    :from,
    :to,
    :type,
  ].freeze

  # Overwrite this method to customize how messages are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(message)
  #   "Message ##{message.id}"
  # end
end
