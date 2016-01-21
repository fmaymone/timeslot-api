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
Authorization: Token token=6eWddg2NcuKtfs9Xt83YwDiWb44
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/friend?query=john</pre>

#### Query Parameters

<pre>query: john</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/friend?query=john&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=6eWddg2NcuKtfs9Xt83YwDiWb44&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;9dd5ebefdf29f179d540f62ad341f425&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 392a9c03-b1ec-467e-bbd4-be364dbff45d
X-Runtime: 0.012071
Vary: Origin
Content-Length: 167</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 163,
    "username" : "John Doe",
    "createdAt" : "2016-01-21T23:11:39.449Z",
    "updatedAt" : "2016-01-21T23:11:39.449Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "friend"
  }
]
```
