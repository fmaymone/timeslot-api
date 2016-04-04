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
Authorization: Token token=EoKH_4vce-aa_ExcvwmH5-dAo0M
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
	-H &quot;Authorization: Token token=EoKH_4vce-aa_ExcvwmH5-dAo0M&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;d023dc89e8ffd0b4063721082cb3dd9b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 993ca699-a9d9-41f4-bad0-0b0b0821a325
X-Runtime: 0.011977
Vary: Origin
Content-Length: 337</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 106,
    "username" : "John Doe",
    "createdAt" : "2016-04-04T20:50:26.003Z",
    "updatedAt" : "2016-04-04T20:50:26.003Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 107,
    "username" : "John Doh",
    "createdAt" : "2016-04-04T20:50:26.006Z",
    "updatedAt" : "2016-04-04T20:50:26.006Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  }
]
```
