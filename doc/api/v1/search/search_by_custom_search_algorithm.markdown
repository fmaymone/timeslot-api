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
Authorization: Token token=-T2xnRyjUSX4aFT6Ep3sP5BhIyc
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
	-H &quot;Authorization: Token token=-T2xnRyjUSX4aFT6Ep3sP5BhIyc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;845a57440f975ca2428b66665d91908b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 749b0c5e-0835-47dc-b006-76c42c23c66f
X-Runtime: 0.012364
Vary: Origin
Content-Length: 337</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 159,
    "username" : "John Doe",
    "createdAt" : "2016-01-21T23:11:39.420Z",
    "updatedAt" : "2016-01-21T23:11:39.420Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 160,
    "username" : "John Doh",
    "createdAt" : "2016-01-21T23:11:39.423Z",
    "updatedAt" : "2016-01-21T23:11:39.423Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  }
]
```
