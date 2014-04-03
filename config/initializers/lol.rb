require 'lol'

LOL_CLIENT = Lol::Client.new ENV['LOL_API_KEY'], region: ENV['LOL_REGION']
