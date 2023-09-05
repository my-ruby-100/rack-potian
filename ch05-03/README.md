# 5.3 HTTP 协议中间件

## 5.3.1 Rack::Chunked


* 服务器可能预先不知道将要传输的内容大小或者因为性能的原因不希望一次性生成并传输所有的响应


```
Transfer-Encoding: chunked

25
This is the data

1C
and this

0
```

* 每一块的内容包含两个部分, 最后一个块只需一行，它的块大小为0

```
一个16进制的值表示块的大小
数据本身
```

* 如果一个 body 能够响应close, 那么迭代之后会被调用


## 5.3.2 Rack::ConditionalGet

```
Cache-Control: max-age=21600
```

```
Last-Modified:
If-Modified-Since
```

```
Etag:
IF-None-Match:
```