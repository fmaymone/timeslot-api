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
Authorization: Token token=oSYQ2fx1ckSkt9W4IAlLMJvCfGw
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/user?query=john_doe%40email.com&amp;attr=email</pre>

#### Query Parameters

<pre>query: john_doe@email.com
attr: email</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/user?query=john_doe%40email.com&amp;attr=email&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=oSYQ2fx1ckSkt9W4IAlLMJvCfGw&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;bd17fd516e909ace90ed461e5d727275&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b34e2873-c6fc-4576-9be3-969a510287de
X-Runtime: 0.008125
Vary: Origin
Content-Length: 110</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 102,
    "username" : "John Doe",
    "image" : null,
    "friendshipState" : null,
    "url" : "http://example.org/v1/users/102"
  }
]
```
