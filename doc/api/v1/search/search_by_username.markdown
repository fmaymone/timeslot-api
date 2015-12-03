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
Authorization: Token token=zdK-GsazcamSY_1GYw3T_U0pg1I
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/user?query=john+doe</pre>

#### Query Parameters

<pre>query: john doe</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/user?query=john+doe&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=zdK-GsazcamSY_1GYw3T_U0pg1I&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;54b282e6cfdcc23676086f28998b11a8&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 22f347d1-0232-4161-a2a5-0cac46dd4d3c
X-Runtime: 0.805218
Vary: Origin
Content-Length: 232</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 168,
    "username" : "John Doe",
    "createdAt" : "2015-12-03T22:10:05.820Z",
    "updatedAt" : "2015-12-03T22:10:05.820Z",
    "deletedAt" : null,
    "image" : "",
    "location" : null,
    "slotCount" : 0,
    "reslotCount" : 0,
    "friendsCount" : 0,
    "friendshipState" : "stranger"
  }
]
```
