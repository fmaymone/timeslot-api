# Search API

## Search by custom attribute

### GET /v1/search/user

returns 404 if query is invalid



### Parameters

Name : query *- required -*
Description : The query of the search

Name : attr
Description : The custom search attribute


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
Authorization: Token token=cE0VQNo5j6GQx371rNWKg5Dm_vY
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/user?query=john_doe%40email.com&amp;attr=email</pre>

#### Query Parameters

<pre>query: john_doe@email.com
attr: email</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/user?query=john_doe%40email.com&amp;attr=email&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=cE0VQNo5j6GQx371rNWKg5Dm_vY&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;623a8efbacaa3494d0d5525132dc5af3&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d5993864-5954-4450-80ed-a1ad37944045
X-Runtime: 0.010361
Vary: Origin
Content-Length: 169</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 160,
    "username" : "John Doe",
    "createdAt" : "2016-01-29T19:39:02.954Z",
    "updatedAt" : "2016-01-29T19:39:02.954Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  }
]
```
