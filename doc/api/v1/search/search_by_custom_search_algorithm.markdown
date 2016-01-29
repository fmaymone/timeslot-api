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
Authorization: Token token=S90PMK4S3Rn1U50QD6dZA3T48A8
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
	-H &quot;Authorization: Token token=S90PMK4S3Rn1U50QD6dZA3T48A8&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;ab867b2042635edae4b27554b24a57e5&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 223e6c49-a145-42aa-88c4-2aa8c9a698ca
X-Runtime: 0.013089
Vary: Origin
Content-Length: 337</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 162,
    "username" : "John Doe",
    "createdAt" : "2016-01-29T19:39:02.982Z",
    "updatedAt" : "2016-01-29T19:39:02.982Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 163,
    "username" : "John Doh",
    "createdAt" : "2016-01-29T19:39:02.985Z",
    "updatedAt" : "2016-01-29T19:39:02.985Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  }
]
```
