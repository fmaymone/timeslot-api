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

<pre>Authorization: Token token=6bUq9fwMODYUWfOIJ-VRNH2sy44
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/29/history</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/29/history&quot; -X GET \
	-H &quot;Authorization: Token token=6bUq9fwMODYUWfOIJ-VRNH2sy44&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;6fec12fac17ab95dbf77f70161ab10d0&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 928494ce-4f9d-40ed-a122-789d718206d5
X-Runtime: 0.015719
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
      "username" : "User 387",
      "userImage" : "",
      "timestamp" : "2016-01-21T23:11:41.971Z"
    },
    {
      "id" : 82,
      "username" : "User 385",
      "userImage" : "",
      "timestamp" : "2016-01-21T23:11:41.923Z"
    }
  ],
  "parentUser" : {
    "id" : 80,
    "username" : "User 383",
    "createdAt" : "2016-01-21T23:11:41.909Z",
    "updatedAt" : "2016-01-21T23:11:41.909Z",
    "deletedAt" : null,
    "image" : ""
  }
}
```
