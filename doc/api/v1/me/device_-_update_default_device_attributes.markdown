# Me API

## Device - Update default device attributes

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
Authorization: Token token=26rN49xhE9jlf5DasC4X7EzByN0
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/me/device</pre>

#### Body
```javascript
{
  "deviceId" : "sn-203462873410834786765439520",
  "system" : "android",
  "version" : "5.0b",
  "token" : "a43ea436c1eea1d5ebdcd86f46577d664fd28ce4f716350b9adff279e1bbc2ee"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/device&quot; -d &#39;{&quot;deviceId&quot;:&quot;sn-203462873410834786765439520&quot;,&quot;system&quot;:&quot;android&quot;,&quot;version&quot;:&quot;5.0b&quot;,&quot;token&quot;:&quot;a43ea436c1eea1d5ebdcd86f46577d664fd28ce4f716350b9adff279e1bbc2ee&quot;}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=26rN49xhE9jlf5DasC4X7EzByN0&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: dd3357d7-cd70-43bf-b8e6-0bee18e8fe92
X-Runtime: 0.006661
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

