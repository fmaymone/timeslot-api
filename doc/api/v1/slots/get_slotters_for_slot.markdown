# Slots API

## Get Slotters for Slot

### GET /v1/slots/:id/slotters

returns a list of all users who reslot the slot. For now there is no distinction between reslot visibilities as backend has no support for this yet.

Includes User data and timestamp.

returns 401 if User not allowed to see Slotter data

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the Slot to get the slotters for


### Response Fields

Name : array
Description : containing creation date of the ReSlot and details of the user who did the reslot

### Request

#### Headers

<pre>Authorization: Token token=Dtkd98SijY6rkgSwpXHHwPUMD-Y
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/63/slotters</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/63/slotters&quot; -X GET \
	-H &quot;Authorization: Token token=Dtkd98SijY6rkgSwpXHHwPUMD-Y&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;70af4a1398d8e93b8679dacfd1e96a6b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 0e84771f-200a-4d76-b3b5-45f87bc8ea79
X-Runtime: 0.016589
Vary: Origin
Content-Length: 441</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-10-03T22:30:44.165Z",
    "slotter" : {
      "id" : 305,
      "username" : "User 270",
      "createdAt" : "2015-10-03T22:30:44.158Z",
      "updatedAt" : "2015-10-03T22:30:44.158Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-10-03T22:30:44.222Z",
    "slotter" : {
      "id" : 309,
      "username" : "User 274",
      "createdAt" : "2015-10-03T22:30:44.217Z",
      "updatedAt" : "2015-10-03T22:30:44.217Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  }
]
```
