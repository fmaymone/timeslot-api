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

Name : location
Description : Home location of user

Name : push
Description : Send push Notifications (true/false)

Name : createdAt
Description : Creation of user

Name : updatedAt
Description : Latest update of user in db

Name : deletedAt
Description : Deletion of user

Name : slotCount
Description : Number of slots for this user

Name : reslotCount
Description : Number of reslots for this user

Name : friendsCount
Description : Number of friends for this user

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=kY9yv2F8nQvuBfh1YaADDbsLmbE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/user?query=John+Do&amp;method=like</pre>

#### Query Parameters

<pre>query: John Do
method: like</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/user?query=John+Do&amp;method=like&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=kY9yv2F8nQvuBfh1YaADDbsLmbE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;67d181b65eb82cb2dadb7c30c36cd2f7&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 09284d38-e91f-4763-9a19-943ac7fae161
X-Runtime: 0.018208
Vary: Origin
Content-Length: 219</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 126,
    "username" : "John Doe",
    "image" : null,
    "friendshipState" : null,
    "url" : "http://example.org/v1/users/126"
  },
  {
    "id" : 127,
    "username" : "John Doh",
    "image" : null,
    "friendshipState" : null,
    "url" : "http://example.org/v1/users/127"
  }
]
```
