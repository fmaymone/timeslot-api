# Users API

## Reset password

### POST /v1/users/reset

This is not ready for production!!!

Resets password to &#39;autechre&#39;

returns OK if valid email

returns 403 if invalid email

### Parameters

Name : email *- required -*
Description : Email of the user for whom to reset password

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/users/reset</pre>

#### Body
```javascript
{
  "email" : "user62@email.com"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/users/reset&quot; -d &#39;{&quot;email&quot;:&quot;user62@email.com&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: c8190b6e-b36d-4632-8e16-a4e969b16609
X-Runtime: 0.006918
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

