# Me API

## Device - Unregister device from push notification service

### PATCH /v1/me/device

returns OK if endpoint was successfully removed

returns 401 if auth token is invalid

returns 422 if parameters are missing or invalid

### Parameters

Name : deviceId *- required -*
Description : A unique device ID

Name : system
Description : A shorthand of the operating system of the device

Name : version
Description : The version number of the devices operating system

Name : token
Description : The device token which is used for device services

Name : endpoint
Description : Boolean flag to unregister device from all extern services

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=8_7zy24aYDSVxd43ZJgyjfx2b7U
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/me/device</pre>

#### Body
```javascript
{
  "deviceId" : "sn-183462873410834786765439518",
  "token" : "a43ea436c1eea1d5ebdcd86f46577d664fd28ce4f716350b9adff279e1bbc2e1",
  "endpoint" : false
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/device&quot; -d &#39;{&quot;deviceId&quot;:&quot;sn-183462873410834786765439518&quot;,&quot;token&quot;:&quot;a43ea436c1eea1d5ebdcd86f46577d664fd28ce4f716350b9adff279e1bbc2e1&quot;,&quot;endpoint&quot;:false}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=8_7zy24aYDSVxd43ZJgyjfx2b7U&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 4020b7da-20eb-469e-a90f-39b7bbcb17ba
X-Runtime: 0.008281
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

