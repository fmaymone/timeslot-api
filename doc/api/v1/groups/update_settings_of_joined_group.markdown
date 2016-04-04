# Groups API

## Update settings of joined group

### PATCH /v1/groups/:group_uuid/members

Change notifications and default alerts for group

returns 200 if setting was successfully updated

returns 403 if user not active group member

returns 404 if group UUID is invalid

returns 422 if parameters are missing

### Parameters

Name : group_uuid *- required -*
Description : ID of the group to delete

Name : notifications
Description : receive notifications?

Name : defaultAlerts
Description : set default alerts for slots in this group

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=wsYE24OgruqQUPXedG68tKLGKM8
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/68feea96-92a2-4432-94bd-4b7213f999a1/members</pre>

#### Body
```javascript
{
  "settings" : {
    "notifications" : "false",
    "defaultAlerts" : "1111100000"
  }
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/68feea96-92a2-4432-94bd-4b7213f999a1/members&quot; -d &#39;{&quot;settings&quot;:{&quot;notifications&quot;:&quot;false&quot;,&quot;defaultAlerts&quot;:&quot;1111100000&quot;}}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=wsYE24OgruqQUPXedG68tKLGKM8&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 898a9ad5-5cb2-40c2-8353-95eadb9df794
X-Runtime: 0.006806
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

