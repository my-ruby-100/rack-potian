# Chapter 3 - 中间件

|本期版本|上期版本
|:---:|:---:
`Sun Sep  3 19:38:14 CST 2023` |


## 3.4 装配中间件

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