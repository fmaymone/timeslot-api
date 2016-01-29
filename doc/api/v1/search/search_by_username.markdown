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
Authorization: Token token=1B8iZXPUOC3HN-NqXd8Qr7BDPW8
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/user?query=john+doe</pre>

#### Query Parameters

<pre>query: john doe</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/user?query=john+doe&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=1B8iZXPUOC3HN-NqXd8Qr7BDPW8&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;890d69737ded32bddcd3c8a313d47640&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c8013028-7523-4ba3-880e-2f8acea028a0
X-Runtime: 0.144514
Vary: Origin
Content-Length: 169</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 158,
    "username" : "John Doe",
    "createdAt" : "2016-01-29T19:39:02.790Z",
    "updatedAt" : "2016-01-29T19:39:02.790Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  }
]
```
