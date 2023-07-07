require_relative 'bootstrap.rb'

rack_app = lambda{|env|
  request = Rack::Request.new(env)
  response = Rack::Response.new
  response.write("============header==========<br />")
  if request.path_info == '/hello'
    response.write('you say hello')
    client = request['client']
    response.write("from #{client}") if client
  else
    response.write("you need provide some client information")
  end
  response.write("<br />============footer=========")
  response.finish
}

Rack::Handler::WEBrick.run rack_app ,:Port=>3000