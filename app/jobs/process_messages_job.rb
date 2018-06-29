class ProcessMessagesJob < ApplicationJob
  queue_as :default

  def perform
    # fetch all scheduled outgoing messages
    messages = Message.where(sent: false).where('send_at < ?', DateTime.now)
    client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT'], ENV['TWILIO_TOKEN'])
    
    messages.each do |message|

      if message.receiver.opted_out == false

        client.messages.create(
          body: message.body,
          to: message.to,
          from: message.from
        )
        
        message.update(sent: true)
      end
    end
  end
end
