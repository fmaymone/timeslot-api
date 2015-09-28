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

<pre>Authorization: Token token=X8cSflmnIIjzVhNzGf-Xsz5gQ8c
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/63/slotters</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/63/slotters&quot; -X GET \
	-H &quot;Authorization: Token token=X8cSflmnIIjzVhNzGf-Xsz5gQ8c&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;0b4adefa3718f5531f4c786d2d20db60&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: da57316f-4913-4634-b372-60b151fc48b8
X-Runtime: 0.019335
Vary: Origin
Content-Length: 441</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-09-28T10:15:58.449Z",
    "slotter" : {
      "id" : 305,
      "username" : "User 270",
      "createdAt" : "2015-09-28T10:15:58.437Z",
      "updatedAt" : "2015-09-28T10:15:58.437Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-09-28T10:15:58.477Z",
    "slotter" : {
      "id" : 309,
      "username" : "User 274",
      "createdAt" : "2015-09-28T10:15:58.472Z",
      "updatedAt" : "2015-09-28T10:15:58.472Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  }
]
```
