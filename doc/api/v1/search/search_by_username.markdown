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
Authorization: Token token=RjrfSfrnr0NvH-dlVHTLSUlq9mU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/user?query=john+doe</pre>

#### Query Parameters

<pre>query: john doe</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/user?query=john+doe&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=RjrfSfrnr0NvH-dlVHTLSUlq9mU&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;b292fe6cf295c48991bb2fe3a512212b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 0d7ae191-8abb-4df8-9395-db13a7344743
X-Runtime: 0.112655
Vary: Origin
Content-Length: 169</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 160,
    "username" : "John Doe",
    "createdAt" : "2015-12-23T11:18:33.188Z",
    "updatedAt" : "2015-12-23T11:18:33.188Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  }
]
```
