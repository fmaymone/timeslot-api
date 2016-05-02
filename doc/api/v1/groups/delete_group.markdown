# Groups API

## Delete group

### DELETE /v1/groups/:group_uuid

Sets &#39;deleted_at&#39; on the group and its memberships. Doesn&#39;t delete anything.

Current User must be group ownerreturns 200 and the updated data for the group

returns 403 if current user not group owner

returns 404 if UUID is invalid

### Parameters

Name : group_uuid *- required -*
Description : ID of the group to delete

Name : keep_slots_in_schedule
Description : Set to true to prevent the removal of the calendar slots from the users schedule. Default: false


### Response Fields

Name : id
Description : ID of the group

Name : name
Description : name of the group

Name : owner
Description : user info of group owner

Name : membersCanPost
Description : Can subscribers add slots?

Name : membersCanInvite
Description : Can subscribers invite friends?

Name : image
Description : URL of the group image

Name : description
Description : The description of the group

Name : createdAt
Description : Creation of group

Name : updatedAt
Description : Latest update of group in db

Name : deletedAt
Description : Deletion of group

Name : membershipState
Description : Membership state for current user

### Request

#### Headers

<pre>Authorization: Token token=fWP3rFqeheRqvTTp3RUDx16UZzY
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groups/51313010-a22d-4cf9-9955-27f2a3cc609c</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/51313010-a22d-4cf9-9955-27f2a3cc609c&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=fWP3rFqeheRqvTTp3RUDx16UZzY&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;e685827d2956378e85c06916084574ea&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ec591629-2053-431c-979a-1ed34be6910e
X-Runtime: 0.098786
Content-Length: 498</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : "51313010-a22d-4cf9-9955-27f2a3cc609c",
  "name" : "Testgroup 109",
  "image" : "",
  "description" : null,
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "public" : false,
  "createdAt" : "2016-05-01T22:54:08.435Z",
  "updatedAt" : "2016-05-01T22:54:08.554Z",
  "deletedAt" : "2016-05-01T22:54:08.553Z",
  "owner" : {
    "id" : 107,
    "username" : "User 222",
    "createdAt" : "2016-05-01T22:54:08.429Z",
    "updatedAt" : "2016-05-01T22:54:08.483Z",
    "deletedAt" : null,
    "image" : ""
  },
  "memberIds" : [],
  "memberCount" : 0,
  "slotCount" : 0,
  "membershipState" : "deleted"
}
```
