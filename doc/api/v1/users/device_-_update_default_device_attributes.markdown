# Users API

## Device - Update default device attributes

### PATCH /v1/users/device

returns OK if endpoint was successfully removed

returns 401 if auth token is invalid

returns 422 if parameters are missing or invalid

### Parameters

Name : deviceId *- required -*
Description : A unique device ID

Name : system
Description : A shorthand of the operating system from the current device

Name : version
Description : The version number of the devices operating system

Name : token
Description : The device token which is used for device services

Name : endpoint
Description : Boolean flag to unregister device from all extern services

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=C4YPzL9HWVSQDok1r1JVCiMW59o
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/users/device</pre>

#### Body
```javascript
{
  "deviceId" : "sn-233462873410834786765439523",
  "system" : "android",
  "version" : "5.0b",
  "token" : "a43ea436c1eea1d5ebdcd86f46577d664fd28ce4f716350b9adff279e1bbc2ee"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/device&quot; -d &#39;{&quot;deviceId&quot;:&quot;sn-233462873410834786765439523&quot;,&quot;system&quot;:&quot;android&quot;,&quot;version&quot;:&quot;5.0b&quot;,&quot;token&quot;:&quot;a43ea436c1eea1d5ebdcd86f46577d664fd28ce4f716350b9adff279e1bbc2ee&quot;}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=C4YPzL9HWVSQDok1r1JVCiMW59o&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: fe975d4b-a9ab-41e0-b076-5aa40739d07c
X-Runtime: 0.010874
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

