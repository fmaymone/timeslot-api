# Groups API

## Update settings of joined group

### PATCH /v1/groups/:group_id/members

Change notifications and default alerts for group

returns 200 if setting was successfully updated

returns 403 if user not active group member

returns 404 if group ID is invalid

returns 422 if parameters are missing

### Parameters

Name : group_id *- required -*
Description : ID of the group to delete

Name : notifications
Description : receive notifications?

Name : defaultAlerts
Description : set default alerts for slots in this group

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=OXPsX4viqT_wvvKdRix21UV2Jek
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/32/members</pre>

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

<pre class="request">curl &quot;http://localhost:5000/v1/groups/32/members&quot; -d &#39;{&quot;settings&quot;:{&quot;notifications&quot;:&quot;false&quot;,&quot;defaultAlerts&quot;:&quot;1111100000&quot;}}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=OXPsX4viqT_wvvKdRix21UV2Jek&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 5ef52acb-527b-450f-b354-a4583c123269
X-Runtime: 0.011436
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

