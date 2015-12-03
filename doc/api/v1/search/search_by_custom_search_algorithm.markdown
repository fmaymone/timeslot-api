# Search API

## Search by custom search algorithm

### GET /v1/search/user

returns 404 if query is invalid



### Parameters

Name : query *- required -*
Description : The query of the search

Name : method
Description : The custom search algorithm


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
Authorization: Token token=TNa6aSIKXOBMvjWy9KBk6Xgz5Ik
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/user?query=jon+do&amp;method=metaphone</pre>

#### Query Parameters

<pre>query: jon do
method: metaphone</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/user?query=jon+do&amp;method=metaphone&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=TNa6aSIKXOBMvjWy9KBk6Xgz5Ik&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;0e1623e5f2ba9b25aeefd52d23ac6418&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 79880147-42b7-44e3-be84-6cd02f00ba35
X-Runtime: 0.139738
Vary: Origin
Content-Length: 463</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 172,
    "username" : "John Doe",
    "createdAt" : "2015-12-03T22:10:06.936Z",
    "updatedAt" : "2015-12-03T22:10:06.936Z",
    "deletedAt" : null,
    "image" : "",
    "location" : null,
    "slotCount" : 0,
    "reslotCount" : 0,
    "friendsCount" : 0,
    "friendshipState" : "stranger"
  },
  {
    "id" : 173,
    "username" : "John Doh",
    "createdAt" : "2015-12-03T22:10:06.952Z",
    "updatedAt" : "2015-12-03T22:10:06.952Z",
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
