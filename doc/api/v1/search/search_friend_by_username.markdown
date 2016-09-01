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
Authorization: Token token=OWN8fLJg5z1xHGBhQBdfP0f9hu4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/friend?query=john</pre>

#### Query Parameters

<pre>query: john</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/search/friend?query=john&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=OWN8fLJg5z1xHGBhQBdfP0f9hu4&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;774fe698037823e3c6c172723eb677ce&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 38220252-2413-4742-b3a8-90f4dbc207b7
X-Runtime: 0.011771
Content-Length: 218</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 110,
    "username" : "John Doe",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:50:56.128Z",
    "updatedAt" : "2016-08-30T09:50:56.128Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "friend"
  }
]
```
