# Guild Guide

An SMS based app that sends incremental messages throughout a students journey to guage their average sentiment


1. StartUserJourneyJob.new.perform(User.last.id, Journey.last.id)
2. ProcessMessagesJob.new.perform



** Text Response **
# {
#   "ToCountry"=>"US", 
#   "ToState"=>"CO", 
#   "SmsMessageSid"=>"SM88cbebfbfb523dfaab84a37e40058daf", 
#   "NumMedia"=>"0", 
#   "ToCity"=>"", 
#   "FromZip"=>"80470", 
#   "SmsSid"=>"SM88cbebfbfb523dfaab84a37e40058daf", 
#   "FromState"=>"CO", 
#   "SmsStatus"=>"received", 
#   "FromCity"=>"DENVER", 
#   "Body"=>"Kkkkkkkk", 
#   "FromCountry"=>"US", 
#   "To"=>"+17204109404", 
#   "ToZip"=>"", 
#   "NumSegments"=>"1", 
#   "MessageSid"=>"SM88cbebfbfb523dfaab84a37e40058daf", 
#   "AccountSid"=>"ACf6f6884ed8853ff5b9531600dc53317d", 
#   "From"=>"+13036188520", 
#   "ApiVersion"=>"2010-04-01"
# }