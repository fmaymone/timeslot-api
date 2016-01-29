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
Authorization: Token token=29kMsLC0mfFFmDUo0OVKfVMGExk
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/3d736743-086b-4b67-9acf-3e2b710f452b/members</pre>

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

<pre class="request">curl &quot;http://localhost:5000/v1/groups/3d736743-086b-4b67-9acf-3e2b710f452b/members&quot; -d &#39;{&quot;settings&quot;:{&quot;notifications&quot;:&quot;false&quot;,&quot;defaultAlerts&quot;:&quot;1111100000&quot;}}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=29kMsLC0mfFFmDUo0OVKfVMGExk&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: f7c936ff-1a58-48b5-aa32-2a831eaf51bb
X-Runtime: 0.034405
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

