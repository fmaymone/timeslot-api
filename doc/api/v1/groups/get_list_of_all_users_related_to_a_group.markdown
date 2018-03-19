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
Authorization: Token token=-AiEFAH7GNkRrCJ5I7zr7etfFQ8
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/a3cc0fb5-9a3b-4bd2-97c6-08ab65ca726b/related</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/groups/a3cc0fb5-9a3b-4bd2-97c6-08ab65ca726b/related&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=-AiEFAH7GNkRrCJ5I7zr7etfFQ8&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;0b93c0350209b6128d3b94a31e1610ca&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 0f5a11de-292f-444d-a0a0-06581e7808d8
X-Runtime: 0.029616
Content-Length: 519</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
