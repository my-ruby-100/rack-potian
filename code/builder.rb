class Builder
  def initialize(&block)

    @middlewares = []
    self.instance_eval(&block)
  end

  def use(middleware)
    
    @middlewares << middleware
  end

  def run(app) 
    @app = app
  end

  def to_app 
    app = @app
    @middlewares.reverse.each do |middleware|
      puts "middleware: #{middleware}"
      app = middleware.new(app)
    end
    puts "\r\n"
    app

    # redux compose
    # @middlewares.reverse.inject(@app) { |app, middleware| middleware(app)}
  end
end