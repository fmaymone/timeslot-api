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
Authorization: Token token=RkVUjUln5aKLvvRX0IFt8sDmUnM
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
	-H &quot;Authorization: Token token=RkVUjUln5aKLvvRX0IFt8sDmUnM&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;963f1b05591f1ad9568cba033baabc56&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3348d41f-d38d-47a5-be6e-d90af2fe3bc9
X-Runtime: 0.009265
Content-Length: 220</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 104,
    "username" : "John Doe",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:50:56.059Z",
    "updatedAt" : "2016-08-30T09:50:56.059Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  }
]
```
