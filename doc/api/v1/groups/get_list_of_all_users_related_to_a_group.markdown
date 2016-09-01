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
Authorization: Token token=TThkF0FiupVx_FZoxP7bfcz1ZuE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/38c88bdc-c63d-44b3-aac1-55eaa222347b/related</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/38c88bdc-c63d-44b3-aac1-55eaa222347b/related&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=TThkF0FiupVx_FZoxP7bfcz1ZuE&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;de58935a402e551ad8dda8c89d9e1e1d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 9a469451-a5ef-4fed-86fd-029a5267610c
X-Runtime: 0.018257
Content-Length: 519</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : "38c88bdc-c63d-44b3-aac1-55eaa222347b",
  "size" : 8,
  "related" : [
    {
      "id" : 362,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "id" : 363,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "id" : 364,
      "state" : "invited",
      "deletedAt" : null
    },
    {
      "id" : 365,
      "state" : "invited",
      "deletedAt" : null
    },
    {
      "id" : 366,
      "state" : "invited",
      "deletedAt" : "2016-08-30T09:50:40.149Z"
    },
    {
      "id" : 367,
      "state" : "invited",
      "deletedAt" : "2016-08-30T09:50:40.149Z"
    },
    {
      "id" : 368,
      "state" : "invited",
      "deletedAt" : "2016-08-30T09:50:40.149Z"
    },
    {
      "id" : 369,
      "state" : "active",
      "deletedAt" : "2016-08-30T09:50:51.378Z"
    }
  ]
}
```
