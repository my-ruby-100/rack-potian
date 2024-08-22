# Chapter 4 - 最简单的Web框架

|本期版本|上期版本
|:---:|:---:
`Thu Aug 22 21:40:34 CST 2024` | `Sat Jul  8 20:15:34 CST 2023` |


## 4.1 Rack::Builder

而这里的run直接把app放到数组的最后。

* <https://github.com/rack/rack/blob/1.1/lib/rack/builder.rb>

**4.1.2 路由**

* **如果在代码块出现了一个map的话，那么不可以在相同的范围内出现 run**

## 4.2 rackup

* **<https://github.com/rack/rack/blob/v2.2.9/lib/rack/server.rb#L327>**

```bash
rackup config.ru
rackup -s thin -p 3000
```


**4.2.2 rackup 实现**

* <https://github.com/rack/rack/blob/v2.2.9/bin/rackup#L5>
* <https://github.com/rack/rack/blob/v2.2.9/lib/rack/server.rb#L167>
* <https://github.com/rack/rack/blob/v2.2.9/lib/rack/server.rb#L215>
* <https://github.com/rack/rack/blob/v2.2.9/lib/rack/server.rb#L286>
* <https://github.com/rack/rack/blob/v2.2.9/lib/rack/server.rb#L421>
* <https://github.com/rack/rack/blob/v2.2.9/lib/rack/server.rb#L344>
* <https://github.com/rack/rack/blob/main/lib/rack/builder.rb#L65>
* <https://github.com/rack/rack/blob/main/lib/rack/builder.rb#L65>


```ruby

app = Rack::Builder.new {
  # 配置文件
}.to_app
```

* 如果一个config.ru的第一行是以#\开始的 ，那 么这一行就是选项行


```ruby
Rack::Handler::WEBrick.run app, options
```


> 可以 《Rebuilding Rails》

