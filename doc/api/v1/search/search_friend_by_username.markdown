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
Authorization: Token token=2FzDO828Rx1WMOIlxGtL-9B3_Tc
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/friend?query=john</pre>

#### Query Parameters

<pre>query: john</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/search/friend?query=john&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=2FzDO828Rx1WMOIlxGtL-9B3_Tc&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;54b26144fb6df145ea317af5792aa80e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7e02c17e-5d06-44bb-bf3c-fdce9b5df924
X-Runtime: 0.011331
Vary: Origin
Content-Length: 167</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 110,
    "username" : "John Doe",
    "createdAt" : "2016-04-04T20:50:26.033Z",
    "updatedAt" : "2016-04-04T20:50:26.033Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "friend"
  }
]
```
