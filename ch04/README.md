# Chapter 4 - 最简单的Web框架

|本期版本|上期版本
|:---:|:---:
`Sat Jul  8 20:15:34 CST 2023` |


## 4.1 Rack::Builder

而这里的run直接把app放到数组的最后。

* <https://github.com/rack/rack/blob/1.1/lib/rack/builder.rb>

## 4.2 rackup

```bash
rackup config.ru
rackup -s thin -p 3000
```

```ruby

app = Rack::Builder.new {
  # 配置文件
}.to_app
```

* 如果一个config.ru的第一行是以#\开始的 ，那 么这一行就是选项行


```ruby
Rack::Handler::WEBrick.run app, options
```

