# Chapter 1 - 简介

|本期版本|上期版本
|:---:|:---:
`Thu Aug 22 16:44:13 CST 2024` | `Sun Sep  3 18:56:57 CST 2023`


## 1.1 什么是Rack

* Ruby应用服务器: 《[Rebuilding HTTP](https://rebuilding-http.com/)》
* Rack 应用程序: 《[Rebuilding Rails](https://rebuilding-rails.com/)》


## 1.2 为什么Rack

`2.x`

* <https://github.com/rack/rack/blob/v2.2.9/lib/rack/handler.rb#L97>

`3.x`

* <https://github.com/rack/rackup/blob/main/lib/rackup/handler.rb#L18>


## 1.3 一试

**1.3.2 Handler**

```bash
bundle exec irb
```

```ruby
require 'rack'
Rack::Handler.constants
```

所有的`Rack Handler`都有一个`run`方法

```ruby
Rack::Handler::WEBrick.run 
```

**1.3.3一个可被call的对象**

> 《[Ruby元编程（第2版）](https://book.douban.com/subject/26575429/)》


* 先用最简单的空 `lambda {}` 作为 `run` 的第一个参数
* 第二个参数是一个 Hash

**1.3.4返回一个数组**

* 这个可被call 的对象需要接受一个参数，即环境变量对象；需要返回一个数组


**1.3.5 其他合法的应用程序**


* 一个合法的Rack 应用程序也可以是任何对象，只要它的类定义了 call 方法