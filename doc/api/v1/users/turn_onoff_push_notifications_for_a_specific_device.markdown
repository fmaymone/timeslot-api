# Users API

## Turn on/off push notifications for a specific device

### PATCH /v1/users/device

returns OK if state was successfully edited

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
Authorization: Token token=A7x67jPwKIsog2sYQ19OLFiZQ9U
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/users/device</pre>

#### Body
```javascript
{
  "deviceId" : "sn-143462873410834786765439514",
  "push" : false
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/device&quot; -d &#39;{&quot;deviceId&quot;:&quot;sn-143462873410834786765439514&quot;,&quot;push&quot;:false}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=A7x67jPwKIsog2sYQ19OLFiZQ9U&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: f845c590-754a-4cbb-a96e-8eb4119321ed
X-Runtime: 0.005335
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

