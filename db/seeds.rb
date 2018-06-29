require 'faker'
require 'faker'

j1 = Journey.create!(
  name: 'Student Checkin',
  description: 'Guage student sentiment over time'
)
j2 = Journey.create!(
  name: 'Student Checkin (spanish)',
  description: 'Guage student sentiment over time (spanish)'
)

MessageTemplate.create!(journey: j1, title: 'Message 1', body: "Hi there. This is GuildEducation. It is month 1 of your educational journey! How are things going? ( please reply with 0-5, and a note about any progress or struggles. Or reply unsubscribe to stop these messages)")
MessageTemplate.create!(journey: j1, title: 'Message 2', body: "Hi there. This is GuildEducation. It is month 2 of your educational journey! How are things going? ( please reply with 0-5, and a note about any progress or struggles. Or reply unsubscribe to stop these messages)")
MessageTemplate.create!(journey: j1, title: 'Message 3', body: "Hi there. This is GuildEducation. It is month 3 of your educational journey! How are things going? ( please reply with 0-5, and a note about any progress or struggles. Or reply unsubscribe to stop these messages)")

MessageTemplate.create!(journey: j2, title: 'Message 1', body: "Hola there. This is GuildEducation. It is month 1 of your educational journey! How are things going? ( please reply with 0-5, and a note about any progress or struggles. Or reply unsubscribe to stop these messages)")
MessageTemplate.create!(journey: j2, title: 'Message 2', body: "Hola there. This is GuildEducation. It is month 2 of your educational journey! How are things going? ( please reply with 0-5, and a note about any progress or struggles. Or reply unsubscribe to stop these messages)")
MessageTemplate.create!(journey: j2, title: 'Message 3', body: "Hola there. This is GuildEducation. It is month 3 of your educational journey! How are things going? ( please reply with 0-5, and a note about any progress or struggles. Or reply unsubscribe to stop these messages)")

1.times do |i|
  f_name = Faker::Name.first_name
  admin = User.create!(
    first_name: f_name,
    last_name: Faker::Name.last_name,
    email: "#{f_name}@guildeducation.com", # user.rb hook to add admin role
    phone: ENV['GUILD_PHONE']
  )
end

1.times do |i|
  f_name = Faker::Name.first_name
  l_name = Faker::Name.last_name
  phone = '+13036188520'

  user = User.create!(
    guild_id: SecureRandom.base64,
    first_name: f_name,
    last_name: l_name,
    phone: phone,
    opted_out: false
  )

  puts "Created User: #{user.id}"

  admin = User.with_role(:admin).sample
  journey = Journey.all.sample

  user.journeys << journey

  3.times do |index|
    m = Message.create!(
      body: journey.message_templates[index].body, # this will work as there are only 3 per journey
      sender_id: admin.id,
      receiver_id: user.id,
      from: admin.phone,
      sent: false,
      to: user.phone,
      type: 'SentMessage',
      send_at: DateTime.now
    )
    puts "Created Message: #{m.id}"

    # s = Sentiment.create!(
    #   quantitative: [1,1,1,1,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,5,5,5,5,5,5,5,5].sample.to_f,
    #   qualatative: Faker::TheFreshPrinceOfBelAir.quote,
    #   user_id: user.id,
    #   message_id: m.id, 
    #   journey_id: journey.id,
    #   created_at: DateTime.now - rand(12).months
    # )

    # puts "Created Sentiment: #{s.id}"
    # puts "--------------------------"
  end
end
