# Me API

## Create or Accept Friend Requests

### POST /v1/me/friendship/:user_id

Accepts an open friend request from other User to current user if one exists.

Creates an open friend request from current user to other User if none exists yet.

Returns OK and the data of the given User.Returns 404 if the given User ID does not exist or the User has his account deactivated.

### Parameters

Name : user_id *- required -*
Description : ID of the User for whom the friendship/request should be invalidated.


### Response Fields

Name : id
Description : ID of the other user

Name : username
Description : Username of the other user

Name : image
Description : URL of the other users image

Name : location
Description : Home location of other user

Name : createdAt
Description : Creation of user

Name : updatedAt
Description : Latest update of user in db

Name : deletedAt
Description : Deletion of user

Name : slotCount
Description : Number of slots for other user

Name : reslotCount
Description : Number of reslots for other user

Name : friendsCount
Description : Number of friends for other user

Name : friendshipState
Description : [pending active, pending passive, friend, stranger]

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=EXPx2-GHCtqe2dLyItsbgz_4hN4
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/me/friendship/92</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/friendship/92&quot; -d &#39;&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=EXPx2-GHCtqe2dLyItsbgz_4hN4&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;237f260126b699cf27db31b26f56cfee&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 26157975-9fe4-438d-98c9-d14ef071e307
X-Runtime: 0.073226
Content-Length: 302</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 92,
  "username" : "John",
  "firstName" : null,
  "middleName" : null,
  "lastName" : null,
  "createdAt" : "2016-08-30T09:50:55.449Z",
  "updatedAt" : "2016-08-30T09:50:55.449Z",
  "deletedAt" : null,
  "image" : "",
  "location" : null,
  "slotCount" : 0,
  "calendarCount" : 0,
  "friendsCount" : 0,
  "friendshipState" : "pending active",
  "previewSlots" : []
}
```
