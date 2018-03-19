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
Authorization: Token token=2wrhNNp6bDBplT3bBqbML-P_Flg
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/87bce5b9-8c5c-4bbb-b652-d7870d974efd/members</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/groups/87bce5b9-8c5c-4bbb-b652-d7870d974efd/members&quot; -d &#39;{&quot;settings&quot;:{&quot;notifications&quot;:&quot;false&quot;,&quot;color&quot;:&quot;WWW222&quot;,&quot;defaultAlerts&quot;:&quot;1111100000&quot;}}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=2wrhNNp6bDBplT3bBqbML-P_Flg&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 31be8123-7109-4ad7-be74-672a78dba3f3
X-Runtime: 0.022534
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

