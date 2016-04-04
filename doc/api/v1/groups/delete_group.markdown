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

<pre>Authorization: Token token=j4aMB9VkFHYqX5qhrtw1zVlsEAU
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groups/fa174835-546d-407d-812b-b31c2e7ea7c8</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/fa174835-546d-407d-812b-b31c2e7ea7c8&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=j4aMB9VkFHYqX5qhrtw1zVlsEAU&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;47f51268d31fc6e0a2b5233d3c1010d2&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 75b869b1-0a26-46e7-bc4c-5920016dd2e8
X-Runtime: 0.076292
Vary: Origin
Content-Length: 475</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : "fa174835-546d-407d-812b-b31c2e7ea7c8",
  "name" : "Testgroup 5",
  "image" : "",
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "public" : false,
  "createdAt" : "2016-04-04T20:50:22.063Z",
  "updatedAt" : "2016-04-04T20:50:22.157Z",
  "deletedAt" : "2016-04-04T20:50:22.156Z",
  "owner" : {
    "id" : 15,
    "username" : "User 76",
    "createdAt" : "2016-04-04T20:50:22.059Z",
    "updatedAt" : "2016-04-04T20:50:22.110Z",
    "deletedAt" : null,
    "image" : ""
  },
  "memberIds" : [],
  "memberCount" : 0,
  "slotCount" : 0,
  "membershipState" : "deleted"
}
```
