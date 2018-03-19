# Groups API

## Update settings of joined group

### PATCH /v1/groups/:group_uuid/members

Change notifications, color, default alerts for group

returns 200 if setting was successfully updated

returns 403 if user not active group member

returns 404 if group UUID is invalid

returns 422 if parameters are missing

### Parameters

Name : group_uuid *- required -*
Description : ID of the group to delete

Name : notifications
Description : receive notifications?

Name : color
Description : color of the group for this member

Name : defaultAlerts
Description : set default alerts for slots in this group

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=tVy2ooYmt5RywN4UvYyPRK8DQRc
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/d17b63bf-368b-4d29-a997-6818571ba8de/members</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/groups/d17b63bf-368b-4d29-a997-6818571ba8de/members&quot; -d &#39;{&quot;settings&quot;:{&quot;notifications&quot;:&quot;false&quot;,&quot;color&quot;:&quot;WWW222&quot;,&quot;defaultAlerts&quot;:&quot;1111100000&quot;}}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=tVy2ooYmt5RywN4UvYyPRK8DQRc&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: b0e331d2-d465-49a1-a587-9a119a94ea80
X-Runtime: 0.013018
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

