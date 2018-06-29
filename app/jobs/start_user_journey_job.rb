class StartUserJourneyJob < ApplicationJob
  queue_as :default

  def perform(user_id, journey_id)
    admin = User.with_role(:admin).sample
    user = User.find(user_id)
    journey = Journey.find(journey_id)

    user.journeys << journey

    journey.message_templates.each_with_index do |template, i|
      message = SentMessage.create!(
        body: template.body,
        sender_id: admin.id,
        receiver_id: user.id,
        send_at: DateTime.now + "#{ (i +1) * 2}".to_i.minutes, # this should be months or something
        sent: false,
        from: admin.phone,
        to: user.phone
      )
    end

  end
end
