# Chapter 3 - 中间件

|本期版本|上期版本
|:---:|:---:
`Thu Aug 22 17:35:57 CST 2024` | `Sun Sep  3 19:38:14 CST 2023`


## 3.1 一个简单的中间件

```ruby
class Decorator
	def initialize(app)
	end
	
	def call(env)
	end
end
```

```
Rack::Handler::WEBrick.run Decorator.new(rack_app), :Port=>3000
```


## 3.2 Rack 响应标准


Ruby 1.9.x 的String已经不支持 each 方法了, 所以通常的做法是用一个字符串数组

## 3.3 为什么中间件

* 中间件可以实现通用的逻辑和业务逻辑进行分离。
* **由于中间件本身也是合法的Rack 应用程序，这就意味着中间件外面还可以包装中间件**



## 3.4 装配中间件

**3.4.1 如何装配**

```ruby
app = Builder.new {
	use Rack::ContentLength
	use Decorator
	run lambda{|env| [200, {}, ["hello world"]]}
}.to_app
```

---
**3.4.2实现 Builder**

> 对所有使用的中间件，我们必须持有它们的顺序信息

**传统方法**

```ruby
def use(middleware)
  @middlewares << middleware
end

@middlewares.reverse.inject(@app) { |app, middleware| middleware.new(app) }
```

**更Ruby化的方法**

```ruby
def use(middleware_class,*options, &block) 
  @middlewares << lambda {|app| middleware_class.new(app,*options, &block)}
end

@middlewares.reverse.inject(@app) { |app, middleware| middleware.call(app)}
```