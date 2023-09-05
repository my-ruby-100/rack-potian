  use Rack::Session::Cookie, :key => 'rack.session',
                              :domain => 'foo.com',
                              :path => '/',
                              :expire_after => 2592000,
                              :secret => 'change_me',
                              :old_secret => 'also_change_me'


run lambda {|env| [200, {"Content-Type" => "text/html"}, ["world"]] }