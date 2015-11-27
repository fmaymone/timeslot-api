# Search API

## Search by username

### GET /v1/search/user

returns 404 if query is invalid



### Parameters

Name : query *- required -*
Description : The query of the search


### Response Fields

Name : id
Description : ID of the user

Name : username
Description : Username of the user

Name : image
Description : URL of the user image

Name : location
Description : Home location of user

Name : push
Description : Send push Notifications (true/false)

Name : createdAt
Description : Creation of user

Name : updatedAt
Description : Latest update of user in db

Name : deletedAt
Description : Deletion of user

Name : slotCount
Description : Number of slots for this user

Name : reslotCount
Description : Number of reslots for this user

Name : friendsCount
Description : Number of friends for this user

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=ah6md5Fs1zgP053sggtt24mQYZc
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/user?query=jon+doe</pre>

#### Query Parameters

<pre>query: jon doe</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/user?query=jon+doe&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=ah6md5Fs1zgP053sggtt24mQYZc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;2d4065279981980f8b788795a44ca2b3&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3d198bfb-7ee9-4f0e-b927-a8a3b2ba98b8
X-Runtime: 0.124489
Vary: Origin
Content-Length: 108</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 164,
    "username" : "John Doe",
    "image" : "",
    "friendshipState" : null,
    "url" : "http://example.org/v1/users/164"
  }
]
```
