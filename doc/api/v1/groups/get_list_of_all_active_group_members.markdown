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
Authorization: Token token=_LsAxWGZptpngAKB_K8nxAV7yVc
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/b47064aa-2baa-4d03-a851-21779deb6a23/members</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/b47064aa-2baa-4d03-a851-21779deb6a23/members&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=_LsAxWGZptpngAKB_K8nxAV7yVc&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;d4963a656c2272fea70ca5ba292ac139&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c07f7e92-a960-4703-bb0c-6e87c02aec4e
X-Runtime: 0.010869
Vary: Origin
Content-Length: 1052</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : "b47064aa-2baa-4d03-a851-21779deb6a23",
  "membersCounter" : 7,
  "members" : [
    {
      "id" : 31,
      "username" : "User 92",
      "createdAt" : "2016-04-04T20:50:22.320Z",
      "updatedAt" : "2016-04-04T20:50:22.320Z",
      "deletedAt" : null,
      "image" : "www.looking.good"
    },
    {
      "id" : 32,
      "username" : "User 93",
      "createdAt" : "2016-04-04T20:50:22.324Z",
      "updatedAt" : "2016-04-04T20:50:22.324Z",
      "deletedAt" : null,
      "image" : ""
    },
    {
      "id" : 33,
      "username" : "User 94",
      "createdAt" : "2016-04-04T20:50:22.334Z",
      "updatedAt" : "2016-04-04T20:50:22.334Z",
      "deletedAt" : null,
      "image" : ""
    },
    {
      "id" : 34,
      "username" : "User 95",
      "createdAt" : "2016-04-04T20:50:22.338Z",
      "updatedAt" : "2016-04-04T20:50:22.338Z",
      "deletedAt" : null,
      "image" : ""
    },
    {
      "id" : 35,
      "username" : "User 96",
      "createdAt" : "2016-04-04T20:50:22.342Z",
      "updatedAt" : "2016-04-04T20:50:22.342Z",
      "deletedAt" : null,
      "image" : ""
    },
    {
      "id" : 36,
      "username" : "User 97",
      "createdAt" : "2016-04-04T20:50:22.347Z",
      "updatedAt" : "2016-04-04T20:50:22.347Z",
      "deletedAt" : null,
      "image" : ""
    },
    {
      "id" : 39,
      "username" : "User 100",
      "createdAt" : "2016-04-04T20:50:22.381Z",
      "updatedAt" : "2016-04-04T20:50:22.381Z",
      "deletedAt" : null,
      "image" : ""
    }
  ]
}
```
