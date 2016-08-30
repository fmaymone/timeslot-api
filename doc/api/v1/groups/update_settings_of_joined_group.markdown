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
Authorization: Token token=64t4t-eum79o7oVwqBMQwAljuR8
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/35b76ce1-059d-43ee-b2bc-d1b29245d8ba/members</pre>

#### Body
```javascript
{
  "settings" : {
    "notifications" : "false",
    "color" : "WWW222",
    "defaultAlerts" : "1111100000"
  }
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/35b76ce1-059d-43ee-b2bc-d1b29245d8ba/members&quot; -d &#39;{&quot;settings&quot;:{&quot;notifications&quot;:&quot;false&quot;,&quot;color&quot;:&quot;WWW222&quot;,&quot;defaultAlerts&quot;:&quot;1111100000&quot;}}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=64t4t-eum79o7oVwqBMQwAljuR8&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 60c6b070-00a8-4aa5-8466-0235e355a21d
X-Runtime: 0.006933
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

