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
Authorization: Token token=XcylOLko_S__ztt4RRHcKU9uYm8
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/21/related</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/21/related&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=XcylOLko_S__ztt4RRHcKU9uYm8&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;550c8625d892e77169f843d3c1a22424&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2c0d6c3b-934f-48d2-86cb-350c06bfcfc0
X-Runtime: 0.019517
Content-Length: 423</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "groupId" : 21,
  "size" : 7,
  "related" : [
    {
      "userId" : 121,
      "state" : "111",
      "deletedAt" : null
    },
    {
      "userId" : 122,
      "state" : "111",
      "deletedAt" : null
    },
    {
      "userId" : 123,
      "state" : "011",
      "deletedAt" : null
    },
    {
      "userId" : 124,
      "state" : "011",
      "deletedAt" : null
    },
    {
      "userId" : 125,
      "state" : "011",
      "deletedAt" : "2015-06-03T10:39:34.922Z"
    },
    {
      "userId" : 126,
      "state" : "011",
      "deletedAt" : "2015-06-03T10:39:34.922Z"
    },
    {
      "userId" : 127,
      "state" : "011",
      "deletedAt" : "2015-06-03T10:39:34.922Z"
    }
  ]
}
```
