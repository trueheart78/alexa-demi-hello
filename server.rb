require 'sinatra'
require 'json'
require 'alexa_rubykit'

def hello
  <<~STUFF.rstrip
  Welcome Demetrius!
  We are so excited that you have moved in. We've missed you
  greatly and can't wait to spend more time with you. We'll
  probably spoil you, so be prepared.

  Hugs and kisses,

  Josh and Lynda
  STUFF
end

post '/hello' do
  req = AlexaRubykit::Request.new JSON.parse(request.body.read)

  response = AlexaRubykit::Response.new
  response.add_speech hello
  return response.build_response
end
