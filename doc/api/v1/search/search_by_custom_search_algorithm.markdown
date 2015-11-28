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
Authorization: Token token=MB4hH5Zw6F94qjTSwZ--MvPLBAc
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/user?query=John+Do&amp;method=like</pre>

#### Query Parameters

<pre>query: John Do
method: like</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/user?query=John+Do&amp;method=like&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=MB4hH5Zw6F94qjTSwZ--MvPLBAc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;1a7558ee973fa10029bcfc111e3d1659&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 78efc3d8-626d-4d51-a535-75a60a868369
X-Runtime: 0.021513
Vary: Origin
Content-Length: 405</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 168,
    "username" : "John Doe",
    "createdAt" : "2015-11-27T15:44:23.519Z",
    "updatedAt" : "2015-11-27T15:44:23.519Z",
    "deletedAt" : null,
    "image" : "",
    "location" : null,
    "slotCount" : 0,
    "reslotCount" : 0,
    "friendsCount" : 0
  },
  {
    "id" : 169,
    "username" : "John Doh",
    "createdAt" : "2015-11-27T15:44:23.523Z",
    "updatedAt" : "2015-11-27T15:44:23.523Z",
    "deletedAt" : null,
    "image" : "",
    "location" : null,
    "slotCount" : 0,
    "reslotCount" : 0,
    "friendsCount" : 0
  }
]
```
