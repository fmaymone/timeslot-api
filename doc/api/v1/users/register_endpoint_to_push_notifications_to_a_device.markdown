# Users API

## Register endpoint to push notifications to a device

### PATCH /v1/users/device

returns OK if endpoint was successfully added

returns 403 if there was no current user

returns 404 if ID is invalid

returns 422 if parameters are missing or invalid

### Parameters

Name : deviceId
Description : A unique device ID (required)

Name : token
Description : The device token which is used for device services

Name : push
Description : Boolean flag to turn on/off push notifications for the current device

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=nw8gQ8WZhk4_JCriiZJTlF9FDdg
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/users/device</pre>

#### Body
```javascript
{
  "deviceId" : "sn-123462873410834786765439512",
  "token" : ""
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/device&quot; -d &#39;{&quot;deviceId&quot;:&quot;sn-123462873410834786765439512&quot;,&quot;token&quot;:&quot;&quot;}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=nw8gQ8WZhk4_JCriiZJTlF9FDdg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 5f5776ab-5723-4792-b76a-062d67347f6b
X-Runtime: 0.310579
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

