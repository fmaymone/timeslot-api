# Groups API

## Get list of all active group members

### GET /v1/groups/:group_uuid/members

returns 200 and a list of all active group members

returns 404 if UUID is invalid

### Parameters

Name : group_uuid *- required -*
Description : ID of the group to get members for


### Response Fields

Name : groupId
Description : ID of the group

Name : size
Description : Number of active group members

Name : members
Description : Array of active members

Name : userId
Description : ID of member

Name : username
Description : name of member

Name : userUrl
Description : URL for member

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=ouK05fvppzBNz-8ko5Ig6UWb530
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/bd0472a6-2a9a-4b4b-a6b7-8747c2c47b61/members</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/bd0472a6-2a9a-4b4b-a6b7-8747c2c47b61/members&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=ouK05fvppzBNz-8ko5Ig6UWb530&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;989254d2c73df1db47c4b8bb0f321ca0&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b1fa9982-739b-4ddf-b274-98dd1cdd5867
X-Runtime: 0.012528
Content-Length: 1065</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : "bd0472a6-2a9a-4b4b-a6b7-8747c2c47b61",
  "membersCounter" : 7,
  "members" : [
    {
      "id" : 354,
      "username" : "User 466",
      "createdAt" : "2016-08-30T09:50:51.249Z",
      "updatedAt" : "2016-08-30T09:50:51.249Z",
      "deletedAt" : null,
      "image" : ""
    },
    {
      "id" : 353,
      "username" : "User 465",
      "createdAt" : "2016-08-30T09:50:51.245Z",
      "updatedAt" : "2016-08-30T09:50:51.245Z",
      "deletedAt" : null,
      "image" : "www.looking.good"
    },
    {
      "id" : 355,
      "username" : "User 467",
      "createdAt" : "2016-08-30T09:50:51.261Z",
      "updatedAt" : "2016-08-30T09:50:51.261Z",
      "deletedAt" : null,
      "image" : ""
    },
    {
      "id" : 356,
      "username" : "User 468",
      "createdAt" : "2016-08-30T09:50:51.266Z",
      "updatedAt" : "2016-08-30T09:50:51.266Z",
      "deletedAt" : null,
      "image" : ""
    },
    {
      "id" : 357,
      "username" : "User 469",
      "createdAt" : "2016-08-30T09:50:51.271Z",
      "updatedAt" : "2016-08-30T09:50:51.271Z",
      "deletedAt" : null,
      "image" : ""
    },
    {
      "id" : 358,
      "username" : "User 470",
      "createdAt" : "2016-08-30T09:50:51.279Z",
      "updatedAt" : "2016-08-30T09:50:51.279Z",
      "deletedAt" : null,
      "image" : ""
    },
    {
      "id" : 361,
      "username" : "User 473",
      "createdAt" : "2016-08-30T09:50:51.307Z",
      "updatedAt" : "2016-08-30T09:50:51.307Z",
      "deletedAt" : null,
      "image" : ""
    }
  ]
}
```
