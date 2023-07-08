# https://github.com/rack/rack/blob/1.1/bin/rackup
# https://github.com/rack/rack/blob/1.1/lib/rack/server.rb#L82
# https://github.com/rack/rack/blob/1.1/lib/rack/server.rb#L132
# https://github.com/rack/rack/blob/1.1/lib/rack/server.rb#L92
# https://github.com/rack/rack/blob/1.1/lib/rack/server.rb#L155
# https://github.com/rack/rack/blob/1.1/lib/rack/server.rb#L107
# https://github.com/rack/rack/blob/1.1/lib/rack/builder.rb#L35

# app = Rack::Builder.new {
  map '/hello' do
    run lambda {|env| [200, {"Content-Type" => "text/html"}, ["hello"]] }
  end

  map '/world' do
    run lambda {|env| [200, {"Content-Type" => "text/html"}, ["world"]] }
  end

  map '/' do
    run lambda {|env| [200, {"Content-Type" => "text/html"}, ["all"]] }
  end
# }.to_app

# Rack::Handler::WEBrick.run app ,:Port=>3000