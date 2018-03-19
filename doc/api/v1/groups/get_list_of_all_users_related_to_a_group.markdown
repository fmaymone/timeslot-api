# Groups API

## Get list of all users related to a group

### GET /v1/groups/:group_uuid/related

Also includes user with pending or refused invitations and inactive or kicked members.

returns 200 &amp; list of all users related to this group

returns 404 if UUID is invalid

### Parameters

Name : group_uuid *- required -*
Description : ID of the group to get related users for


### Response Fields

Name : groupId
Description : ID of the group

Name : size
Description : Number of group members (excluding owner)

Name : related
Description : Array of related users

Name : userId
Description : ID of user

Name : state
Description : state of membership

Name : deletedAt
Description : Deletion date of membership

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=YxojpRoWpVzWtItNCi6tGYuq-gA
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/f0bcf80a-3070-44dd-9d85-447955e38493/related</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/groups/f0bcf80a-3070-44dd-9d85-447955e38493/related&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=YxojpRoWpVzWtItNCi6tGYuq-gA&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;5f6ce2c53d6848d53554c30c35912f49&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3c9d0963-632d-4b9f-a97d-29fca5d185c2
X-Runtime: 0.018558
Content-Length: 519</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
