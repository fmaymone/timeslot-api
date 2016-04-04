# Search API

## Search by group name

### GET /v1/search/group

returns 404 if query is invalid



### Parameters

Name : query *- required -*
Description : The query of the search


### Response Fields

Name : id
Description : ID of the group

Name : name
Description : name of the group

Name : upcomingCount
Description : Number of upcoming group slots

Name : next
Description : Start date and Time of the next upcoming slot

Name : image
Description : URL of the group image

Name : url
Description : ressource URL for the group

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=j72HNIK4mkv5l2gvbR6tgbcfJ_E
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/group?query=timeslot+developer</pre>

#### Query Parameters

<pre>query: timeslot developer</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/search/group?query=timeslot+developer&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=j72HNIK4mkv5l2gvbR6tgbcfJ_E&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;51465abce3d04b14d553020b826b77df&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3ece5251-0004-4244-a980-f4964fd5fe10
X-Runtime: 0.009161
Vary: Origin
Content-Length: 358</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : "d90bde27-2484-4a76-916f-ae4fd3643bfd",
    "name" : "Timeslot Developer Group (Berlin)",
    "image" : "",
    "public" : false,
    "owner" : {
      "id" : 118,
      "username" : "User 265",
      "createdAt" : "2016-04-04T20:50:26.147Z",
      "updatedAt" : "2016-04-04T20:50:26.147Z",
      "deletedAt" : null,
      "image" : ""
    },
    "createdAt" : "2016-04-04T20:50:26.149Z",
    "updatedAt" : "2016-04-04T20:50:26.149Z",
    "deletedAt" : null
  }
]
```
