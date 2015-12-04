# Slots API

## Get Reslot History aka Chronic for Slot

### GET /v1/slots/:id/history

returns list of all previous reslots for the slot. Includes User data and timestamp.

returns 401 if User not allowed to see reslot history

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the Slot to get the chronic for


### Response Fields

Name : predecessors
Description : Array of Users who had (re-)slottet that slot before

Name : parentUserId
Description : ID of the creator of the original slot

Name : parentUsername
Description : Username of the creator of the original slot

Name : parentUserImage
Description : Image of the creator of the original slot

### Request

#### Headers

<pre>Authorization: Token token=x6BOsf6VujjryO87ebast1EsIe0
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/30/history</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/30/history&quot; -X GET \
	-H &quot;Authorization: Token token=x6BOsf6VujjryO87ebast1EsIe0&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;8ffbcca2454932a7264acdbc279688aa&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 271a3d13-cd47-4b3f-af0b-b97b6952f9b8
X-Runtime: 0.015286
Vary: Origin
Content-Length: 341</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "predecessors" : [
    {
      "id" : 84,
      "username" : "User 372",
      "userImage" : "",
      "timestamp" : "2015-12-04T16:56:53.613Z"
    },
    {
      "id" : 82,
      "username" : "User 370",
      "userImage" : "",
      "timestamp" : "2015-12-04T16:56:53.571Z"
    }
  ],
  "parentUser" : {
    "id" : 80,
    "username" : "User 368",
    "createdAt" : "2015-12-04T16:56:53.559Z",
    "updatedAt" : "2015-12-04T16:56:53.559Z",
    "deletedAt" : null,
    "image" : ""
  }
}
```
