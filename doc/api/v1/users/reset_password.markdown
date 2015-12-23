# Users API

## Reset password

### POST /v1/users/reset

Resets password and sends it to user via email

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
  "email" : "success@simulator.amazonses.com"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/reset&quot; -d &#39;{&quot;email&quot;:&quot;success@simulator.amazonses.com&quot;}&#39; -X POST \
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
X-Request-Id: e1461858-4eb2-4ace-9744-2025e23a25af
X-Runtime: 0.034817
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

