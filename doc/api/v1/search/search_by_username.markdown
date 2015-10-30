# Search API

## Search by username

### GET /v1/search/user

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
Authorization: Token token=OXJsHvdc1XMNqohnru1p85Qz7JA
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/user?query=jon+doe</pre>

#### Query Parameters

<pre>query: jon doe</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/user?query=jon+doe&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=OXJsHvdc1XMNqohnru1p85Qz7JA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;8f8a73bdf6ddeb9b80e01936907fbe9b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 0dc54a5c-4c1f-4d07-8bf2-ab1dc29d7118
X-Runtime: 0.112279
Vary: Origin
Content-Length: 110</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 100,
    "username" : "John Doe",
    "image" : null,
    "friendshipState" : null,
    "url" : "http://example.org/v1/users/100"
  }
]
```
