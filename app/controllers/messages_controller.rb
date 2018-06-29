class MessagesController < ApplicationController
  
  def receive
    user = User.find_by_phone(params['From'])
    journey_id =  user.journeys.empty? ? Journey.first.id : user.journeys.first.id # how to deal with random text entries

    message = ReceivedMessage.create!(
      body: params["Body"],
      sender: user,
      receiver: User.with_role(:admin).first,
      sent: true
    )

    thanks_sentence = user ? "Thank you for the feedback #{user.first_name}" : "Thank you for the feedback"

    client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT'], ENV['TWILIO_TOKEN'])
    client.messages.create({
          from: ENV['GUILD_PHONE'],
          to: params['From'],
          body: "#{thanks_sentence}. Your education advisor will be in touch."
        })

    log_sentiment(message.id, journey_id, user.id, params)
  end

  def log_sentiment(message_id, journey_id, user_id, params)
    body = params["Body"]
    quantitative = body.scan(/\d+/).first
    Sentiment.create!(
      journey_id: journey_id,
      message_id: message_id,
      user_id: user_id,
      quantitative: quantitative,
      qualatative: body
    )
  end


  def trigger
    ProcessMessagesJob.new.perform

    flash[:success] = "Sent Queued SMS messages"
    redirect_to root_url
  end
end
