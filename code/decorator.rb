class Decorator
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)

    new_body = "==========header======"
    body.each {|str| new_body << str}

    new_body << "<br />======footer"
    headers['Content-Length'] = new_body.bytesize.to_s
    [status, headers, [new_body]]
  end
end