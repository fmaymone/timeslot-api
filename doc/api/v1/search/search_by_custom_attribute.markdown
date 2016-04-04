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
Authorization: Token token=Ak0YMeh7tqAMY7rod2hZ7_uV-Es
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/user?query=john_doe%40email.com&amp;attr=email</pre>

#### Query Parameters

<pre>query: john_doe@email.com
attr: email</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/search/user?query=john_doe%40email.com&amp;attr=email&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=Ak0YMeh7tqAMY7rod2hZ7_uV-Es&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;6b9536bcb8002cc61c8a325d128564cd&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3037d4db-1d9e-4bf7-aa74-6ce134746dda
X-Runtime: 0.008008
Vary: Origin
Content-Length: 169</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 104,
    "username" : "John Doe",
    "createdAt" : "2016-04-04T20:50:25.983Z",
    "updatedAt" : "2016-04-04T20:50:25.983Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  }
]
```
