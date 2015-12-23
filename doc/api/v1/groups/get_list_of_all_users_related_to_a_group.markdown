# Groups API

## Get list of all users related to a group

### GET /v1/groups/:group_id/related

Also includes user with pending or refused invitations and inactive or kicked members.

returns 200 &amp; list of all users related to this group

returns 404 if ID is invalid

### Parameters

Name : group_id *- required -*
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
Authorization: Token token=Df7vEsS2gPIFxp2ylf5ch-FzY7Y
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/16/related</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/16/related&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=Df7vEsS2gPIFxp2ylf5ch-FzY7Y&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;334bb9e4e6e2b5670f17188718599543&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 91a91171-ec8f-47f5-a376-6d42b5b97075
X-Runtime: 0.017233
Vary: Origin
Content-Length: 442</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "groupId" : 16,
  "size" : 7,
  "related" : [
    {
      "userId" : 44,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "userId" : 45,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "userId" : 46,
      "state" : "invited",
      "deletedAt" : null
    },
    {
      "userId" : 47,
      "state" : "invited",
      "deletedAt" : null
    },
    {
      "userId" : 48,
      "state" : "invited",
      "deletedAt" : "2015-12-23T11:18:27.365Z"
    },
    {
      "userId" : 49,
      "state" : "invited",
      "deletedAt" : "2015-12-23T11:18:27.365Z"
    },
    {
      "userId" : 50,
      "state" : "invited",
      "deletedAt" : "2015-12-23T11:18:27.365Z"
    }
  ]
}
```
