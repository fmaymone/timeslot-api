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
Authorization: Token token=flQ-1YWzimZDX-eInzMjU1sh4ec
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/628cfdfa-f625-4181-9b7e-afda6663ac58/related</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/628cfdfa-f625-4181-9b7e-afda6663ac58/related&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=flQ-1YWzimZDX-eInzMjU1sh4ec&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;561319034eaeb68c401571a0d322d4a5&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6ebdee32-8593-49fd-ad6f-c65e9612ee82
X-Runtime: 0.013843
Vary: Origin
Content-Length: 511</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : "628cfdfa-f625-4181-9b7e-afda6663ac58",
  "size" : 8,
  "related" : [
    {
      "id" : 47,
      "state" : "active",
      "deletedAt" : "2016-04-04T20:50:22.464Z"
    },
    {
      "id" : 46,
      "state" : "invited",
      "deletedAt" : "2016-04-04T20:50:18.806Z"
    },
    {
      "id" : 45,
      "state" : "invited",
      "deletedAt" : "2016-04-04T20:50:18.806Z"
    },
    {
      "id" : 44,
      "state" : "invited",
      "deletedAt" : "2016-04-04T20:50:18.806Z"
    },
    {
      "id" : 43,
      "state" : "invited",
      "deletedAt" : null
    },
    {
      "id" : 42,
      "state" : "invited",
      "deletedAt" : null
    },
    {
      "id" : 41,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "id" : 40,
      "state" : "active",
      "deletedAt" : null
    }
  ]
}
```
