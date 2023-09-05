# Chapter 2 - Rack初探

|本期版本|上期版本
|:---:|:---:
`Sun Sep  3 19:34:42 CST 2023` | -

## 2.2 Request


```ruby
request = Rack::Request.new(env)
```


## 2.3 Response

```ruby
response = Rack::Response.new
```

**2.3.1 响应体**

* 直接设置`response.body`。此时你必须自己设置响应头中Content-Length的值
* 用`response.write`增量写入内容，自动填充Content-Length的值
* 不管用什么方法，最后用`response.ﬁnish`完成
* `Content-Length` 的值必须为字符串

**2.3.2 状态码**

* Response提供了一个 `redirect` 方法直接进行重定向

**2.3.3 响应头**

```ruby
response.headers['Content-Type'] = 'text/plain'
```