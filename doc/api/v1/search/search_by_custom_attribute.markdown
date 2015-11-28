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
Authorization: Token token=rrvVLZtrnucaqDkCtCVdgqo63t8
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
	-H &quot;Authorization: Token token=rrvVLZtrnucaqDkCtCVdgqo63t8&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;1fb14b20daa5b6ae7a11701a739e552b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4af3811d-fd7f-44c0-8f63-711fad2951cb
X-Runtime: 0.014511
Vary: Origin
Content-Length: 203</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 166,
    "username" : "John Doe",
    "createdAt" : "2015-11-27T15:44:23.489Z",
    "updatedAt" : "2015-11-27T15:44:23.489Z",
    "deletedAt" : null,
    "image" : "",
    "location" : null,
    "slotCount" : 0,
    "reslotCount" : 0,
    "friendsCount" : 0
  }
]
```
