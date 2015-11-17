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

<pre>Authorization: Token token=tZti12Ghfz-j7-f6dvm6bf7BQTM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/21/slotters</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/21/slotters&quot; -X GET \
	-H &quot;Authorization: Token token=tZti12Ghfz-j7-f6dvm6bf7BQTM&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;924f21d24be750f73e997082aef8b8d6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c28cf0f1-4cf6-48a5-8635-d016359e891d
X-Runtime: 0.027856
Vary: Origin
Content-Length: 439</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-11-17T12:12:41.072Z",
    "slotter" : {
      "id" : 67,
      "username" : "User 308",
      "createdAt" : "2015-11-17T12:12:41.070Z",
      "updatedAt" : "2015-11-17T12:12:41.070Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-11-17T12:12:41.090Z",
    "slotter" : {
      "id" : 70,
      "username" : "User 312",
      "createdAt" : "2015-11-17T12:12:41.088Z",
      "updatedAt" : "2015-11-17T12:12:41.088Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  }
]
```
