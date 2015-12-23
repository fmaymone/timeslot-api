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
Authorization: Token token=s4P5hP09W1s4FNmxSH_PwsuRxqU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/group?query=timeslot+developer</pre>

#### Query Parameters

<pre>query: timeslot developer</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/group?query=timeslot+developer&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=s4P5hP09W1s4FNmxSH_PwsuRxqU&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;32c7474180e9df77af974ca1aa335478&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2f28fcfd-aab7-466f-9e84-319aa6850486
X-Runtime: 0.009538
Vary: Origin
Content-Length: 135</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 34,
    "name" : "Timeslot Developer Group (Berlin)",
    "image" : "",
    "upcomingCount" : 0,
    "next" : null,
    "url" : "http://example.org/v1/groups/34"
  }
]
```
