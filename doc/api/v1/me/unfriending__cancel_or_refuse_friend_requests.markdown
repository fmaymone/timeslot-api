# Me API

## Unfriending / Cancel or Refuse Friend Requests

### DELETE /v1/me/friendship/:user_id

Deletes the friendship if both Users are friends.

Refuses an open friend request from other User to current user.

Cancels an open friend request from current user to other User.

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
Authorization: Token token=WBHC7e_od1TOIvcoEBoTaYjPjCY
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/me/friendship/102</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/me/friendship/102&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=WBHC7e_od1TOIvcoEBoTaYjPjCY&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;49f2a1376850e06b69fb345d702456bc&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: debcf773-9171-4c8d-9bf1-f771a3b92088
X-Runtime: 0.119352
Content-Length: 297</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
