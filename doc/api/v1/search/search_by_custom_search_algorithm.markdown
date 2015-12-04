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
Authorization: Token token=O_FQbwd446HUkh_51wvxUDIrzQ8
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
	-H &quot;Authorization: Token token=O_FQbwd446HUkh_51wvxUDIrzQ8&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;6b4bd02d687bd0a5daf12120869dc422&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8b5db5a2-a39a-4576-bbf1-bd3f70d1aa69
X-Runtime: 0.020534
Vary: Origin
Content-Length: 463</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 172,
    "username" : "John Doe",
    "createdAt" : "2015-12-04T16:56:50.516Z",
    "updatedAt" : "2015-12-04T16:56:50.516Z",
    "deletedAt" : null,
    "image" : "",
    "location" : null,
    "slotCount" : 0,
    "reslotCount" : 0,
    "friendsCount" : 0,
    "friendshipState" : "stranger"
  },
  {
    "id" : 173,
    "username" : "John Doh",
    "createdAt" : "2015-12-04T16:56:50.540Z",
    "updatedAt" : "2015-12-04T16:56:50.540Z",
    "deletedAt" : null,
    "image" : "",
    "location" : null,
    "slotCount" : 0,
    "reslotCount" : 0,
    "friendsCount" : 0,
    "friendshipState" : "stranger"
  }
]
```
