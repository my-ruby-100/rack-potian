# Chapter 2 - Rack初探

|本期版本|上期版本
|:---:|:---:
`Thu Aug 22 17:11:46 CST 2024` | `Sun Sep  3 19:34:42 CST 2023`


## 2.1 环境

* `env` 数据源自于应用服务器通过 `Socket` 解析
* **直接存取环境变量虽然直接高效，但却需要手工处理很多麻烦的事情**

## 2.2 Request


```ruby
request = Rack::Request.new(env)
```


## 2.3 Response

```ruby
response = Rack::Response.new
```

**2.3.1 响应体**

* 直接设置`response.body`。此时你必须自己设置响应头中 `Content-Length` 的值

```bash
rsp.body = [body]
rsp.headers['Content-Length'] = body.bytesize.to_s
rsp.finish
```

* 用`response.write`增量写入内容，自动填充`Content-Length`的值

```bash
rsp.write("<br />====header===<br />")
rsp.write("<br />====footer===<br />")
rsp.finish
```

* 不管用什么方法，最后用`response.ﬁnish`完成. **将装配处符合 Rack 规范的一个数组-这个数组有是那个成员：状态码、响应头和响应体**
* `Content-Length` 的值必须为字符串

**2.3.2 状态码**

改变状态码

```ruby
rsp.status = 200
```

* Response提供了一个 `redirect` 方法直接进行重定向

```ruby
rsp.redirect(target, status=302)
```

**2.3.3 响应头**

```ruby
response.headers['Content-Type'] = 'text/plain'
```