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
Authorization: Token token=gxV04lBHrkxtQ7x_QT9s2T4nrqM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/user?query=jon+do&amp;method=metaphone</pre>

#### Query Parameters

<pre>query: jon do
method: metaphone</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/search/user?query=jon+do&amp;method=metaphone&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=gxV04lBHrkxtQ7x_QT9s2T4nrqM&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;c96ffa7ae604131ec57985de8e71c138&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1978eec8-d818-49c6-8ec8-119d5f095fea
X-Runtime: 0.016892
Content-Length: 439</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 106,
    "username" : "John Doe",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:50:56.083Z",
    "updatedAt" : "2016-08-30T09:50:56.083Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 107,
    "username" : "John Doh",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:50:56.087Z",
    "updatedAt" : "2016-08-30T09:50:56.087Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  }
]
```
