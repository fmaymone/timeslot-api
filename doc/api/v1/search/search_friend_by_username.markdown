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
Authorization: Token token=KFngFI8x9sklpm3cCrfhGh4lc98
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/friend?query=john</pre>

#### Query Parameters

<pre>query: john</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/friend?query=john&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=KFngFI8x9sklpm3cCrfhGh4lc98&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;13bc1efa5bc73cd0460133ef0154c727&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 810ff512-76bd-41fe-96a6-fa4d945d7e03
X-Runtime: 0.013434
Vary: Origin
Content-Length: 167</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 168,
    "username" : "John Doe",
    "createdAt" : "2016-01-05T13:32:46.621Z",
    "updatedAt" : "2016-01-05T13:32:46.621Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "friend"
  }
]
```
