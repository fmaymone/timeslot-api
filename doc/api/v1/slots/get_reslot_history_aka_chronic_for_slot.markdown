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

<pre>Authorization: Token token=ZOZcQp-QVluydgt39x9zvvYOWTg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/30/history</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/30/history&quot; -X GET \
	-H &quot;Authorization: Token token=ZOZcQp-QVluydgt39x9zvvYOWTg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;8376010270a074487a50bf3f25fa7572&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 34ed73d9-81ad-4fea-93b4-de035dfdec03
X-Runtime: 0.017751
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
      "username" : "User 308",
      "userImage" : null,
      "timestamp" : "2015-10-30T15:01:05.664Z"
    },
    {
      "id" : 84,
      "username" : "User 306",
      "userImage" : null,
      "timestamp" : "2015-10-30T15:01:05.651Z"
    }
  ],
  "parentUser" : {
    "id" : 82,
    "username" : "User 304",
    "createdAt" : "2015-10-30T15:01:05.638Z",
    "updatedAt" : "2015-10-30T15:01:05.638Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  }
}
```
