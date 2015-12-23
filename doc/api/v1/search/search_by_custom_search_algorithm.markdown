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
Authorization: Token token=l1Jf4G6194jS7zHhuST-rq-QWSk
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
	-H &quot;Authorization: Token token=l1Jf4G6194jS7zHhuST-rq-QWSk&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;e82f256e98dafa7435a8b10f7d438f0f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: fd3de30e-41f1-493d-9cab-7c4f058e14eb
X-Runtime: 0.012029
Vary: Origin
Content-Length: 337</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 164,
    "username" : "John Doe",
    "createdAt" : "2015-12-23T11:18:33.334Z",
    "updatedAt" : "2015-12-23T11:18:33.334Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 165,
    "username" : "John Doh",
    "createdAt" : "2015-12-23T11:18:33.337Z",
    "updatedAt" : "2015-12-23T11:18:33.337Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  }
]
```
