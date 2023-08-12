# 5.6 会话管理


## 5.6.1 HTTP Cookies

**客户端保存cookies**

```
require 'securerandom'
"Set-Cookie"=>"id=#{SecureRandom.hex}"}
```

```ruby
Time.now.gmtime.strftime("%a, %d-%b-%Y %H:%M:%S GMT")
```


**Client Request**

```
Cookie: name=value
```

## 5.6.2 Rack::Session::Cookie

* 会话是一个Ruby的Hash对象，其中的数据采用 base64编码保存

## Ref

* <https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Cookies>
* <https://api.rubyonrails.org/v7.0.0/classes/ActionDispatch/Cookies.html>
