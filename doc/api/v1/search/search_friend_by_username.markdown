# Search API

## Search friend by username

### GET /v1/search/friend

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

Name : createdAt
Description : Creation of user

Name : updatedAt
Description : Latest update of user in db

Name : deletedAt
Description : Deletion of user

Name : friendshipState
Description : The friendship relation to the current user

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=LungRSOnJHIyJDXivw4l_G_daBw
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/friend?query=john</pre>

#### Query Parameters

<pre>query: john</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/friend?query=john&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=LungRSOnJHIyJDXivw4l_G_daBw&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;4f432f2fcbddc161c5bdb3ebb2633d0e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 5c5de31f-6fd8-4076-bfb0-c8aa6a07df53
X-Runtime: 0.015076
Vary: Origin
Content-Length: 167</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 166,
    "username" : "John Doe",
    "createdAt" : "2016-01-29T19:39:03.016Z",
    "updatedAt" : "2016-01-29T19:39:03.016Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "friend"
  }
]
```
