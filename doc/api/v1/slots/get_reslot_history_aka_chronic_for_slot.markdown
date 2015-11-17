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

<pre>Authorization: Token token=pwGX20ZUPun6ODOffVBfme-z8sw
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/30/history</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/30/history&quot; -X GET \
	-H &quot;Authorization: Token token=pwGX20ZUPun6ODOffVBfme-z8sw&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;4422b5d7494396095f97bd4111642df0&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a603b831-974c-4abc-9489-759eadea981c
X-Runtime: 0.054394
Vary: Origin
Content-Length: 375</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "predecessors" : [
    {
      "id" : 86,
      "username" : "User 332",
      "userImage" : null,
      "timestamp" : "2015-11-17T12:12:41.230Z"
    },
    {
      "id" : 84,
      "username" : "User 330",
      "userImage" : null,
      "timestamp" : "2015-11-17T12:12:41.216Z"
    }
  ],
  "parentUser" : {
    "id" : 82,
    "username" : "User 328",
    "createdAt" : "2015-11-17T12:12:41.203Z",
    "updatedAt" : "2015-11-17T12:12:41.203Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  }
}
```
