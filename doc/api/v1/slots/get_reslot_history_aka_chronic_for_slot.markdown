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

<pre>Authorization: Token token=ZovreHNodhJrz31qnD00VSZTJwA
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/71/history</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/71/history&quot; -X GET \
	-H &quot;Authorization: Token token=ZovreHNodhJrz31qnD00VSZTJwA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;eee2c3e3e95f400d15eebbe0086fa4bb&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8ddff6e3-55ea-4023-94d9-45bc3d690f8d
X-Runtime: 0.030115
Vary: Origin
Content-Length: 378</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "predecessors" : [
    {
      "id" : 316,
      "username" : "User 280",
      "userImage" : null,
      "timestamp" : "2015-09-20T18:49:38.047Z"
    },
    {
      "id" : 315,
      "username" : "User 279",
      "userImage" : null,
      "timestamp" : "2015-09-20T18:49:38.035Z"
    }
  ],
  "parentUser" : {
    "id" : 314,
    "username" : "User 278",
    "createdAt" : "2015-09-20T18:49:38.028Z",
    "updatedAt" : "2015-09-20T18:49:38.028Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  }
}
```
