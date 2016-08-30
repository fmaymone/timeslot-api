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

Name : defaultColor
Description : default color of the group, can be overwritten per member

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

<pre>Authorization: Token token=DwHGqkPL9wI8U8DZg6dcbRoqHI8
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groups/fcfc983a-605c-4ea3-afd4-f8fbb12303a0</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/fcfc983a-605c-4ea3-afd4-f8fbb12303a0&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=DwHGqkPL9wI8U8DZg6dcbRoqHI8&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;24abab24af4d53fbeb429ff6af8d12e4&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: badae91c-5701-4147-80d3-b7277f95af89
X-Runtime: 0.189803
Content-Length: 590</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : "fcfc983a-605c-4ea3-afd4-f8fbb12303a0",
  "name" : "Testgroup 130",
  "image" : "",
  "description" : null,
  "defaultColor" : "000000",
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "public" : false,
  "createdAt" : "2016-08-30T09:50:50.448Z",
  "updatedAt" : "2016-08-30T09:50:50.654Z",
  "deletedAt" : "2016-08-30T09:50:50.653Z",
  "owner" : {
    "id" : 314,
    "username" : "User 424",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:50:50.445Z",
    "updatedAt" : "2016-08-30T09:50:50.510Z",
    "deletedAt" : null,
    "image" : ""
  },
  "memberIds" : [],
  "memberCount" : 0,
  "slotCount" : 0,
  "membershipState" : "deleted",
  "color" : "000000"
}
```
