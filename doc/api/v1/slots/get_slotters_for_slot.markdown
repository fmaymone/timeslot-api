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

<pre>Authorization: Token token=_kqCNe4yDGn5-edQQLHeE1OofSE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/63/slotters</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/63/slotters&quot; -X GET \
	-H &quot;Authorization: Token token=_kqCNe4yDGn5-edQQLHeE1OofSE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;278eaed83ab9278c6ee681d87ce30499&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 891137e5-2d80-4212-a24f-b4d4757f5fda
X-Runtime: 0.018895
Vary: Origin
Content-Length: 441</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-09-20T18:49:37.854Z",
    "slotter" : {
      "id" : 305,
      "username" : "User 270",
      "createdAt" : "2015-09-20T18:49:37.843Z",
      "updatedAt" : "2015-09-20T18:49:37.843Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-09-20T18:49:37.882Z",
    "slotter" : {
      "id" : 309,
      "username" : "User 274",
      "createdAt" : "2015-09-20T18:49:37.877Z",
      "updatedAt" : "2015-09-20T18:49:37.877Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  }
]
```
