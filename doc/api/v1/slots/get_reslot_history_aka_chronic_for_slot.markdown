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

<pre>Authorization: Token token=P-nWkvr-sIud56SAoQy0uCGOo_Q
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/56/history</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/56/history&quot; -X GET \
	-H &quot;Authorization: Token token=P-nWkvr-sIud56SAoQy0uCGOo_Q&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;7934e1e5fd0bcbb1c4f4b818f269fd8b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 402e1309-ac28-4ad9-8916-a8777727aa2b
X-Runtime: 0.025730
Content-Length: 378</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "predecessors" : [
    {
      "id" : 219,
      "username" : "User 216",
      "userImage" : null,
      "timestamp" : "2015-06-22T08:44:25.227Z"
    },
    {
      "id" : 218,
      "username" : "User 215",
      "userImage" : null,
      "timestamp" : "2015-06-22T08:44:25.220Z"
    }
  ],
  "parentUser" : {
    "id" : 217,
    "username" : "User 214",
    "createdAt" : "2015-06-22T08:44:25.214Z",
    "updatedAt" : "2015-06-22T08:44:25.214Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  }
}
```
