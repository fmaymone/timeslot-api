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

<pre>Authorization: Token token=LAqs56ajFLpIKzTuFFFwfebGp_0
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/64/history</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/64/history&quot; -X GET \
	-H &quot;Authorization: Token token=LAqs56ajFLpIKzTuFFFwfebGp_0&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;fcb14e5768e94ad8670337f30c7a904d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d330bb1b-b502-4d57-ab6a-7cf7f4ecca5f
X-Runtime: 0.029490
Vary: Origin
Content-Length: 378</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "predecessors" : [
    {
      "id" : 302,
      "username" : "User 268",
      "userImage" : null,
      "timestamp" : "2015-09-14T10:32:58.347Z"
    },
    {
      "id" : 301,
      "username" : "User 267",
      "userImage" : null,
      "timestamp" : "2015-09-14T10:32:58.339Z"
    }
  ],
  "parentUser" : {
    "id" : 300,
    "username" : "User 266",
    "createdAt" : "2015-09-14T10:32:58.332Z",
    "updatedAt" : "2015-09-14T10:32:58.332Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  }
}
```
