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

<pre>Authorization: Token token=YDSemXk1VMGq5U4JF9Lc7rfygtQ
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/21/slotters</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/21/slotters&quot; -X GET \
	-H &quot;Authorization: Token token=YDSemXk1VMGq5U4JF9Lc7rfygtQ&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;fdc00ccea9ea075811ae2494e2d9e895&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 81a70f52-5aa1-4a5f-ab02-1b329553551d
X-Runtime: 0.012977
Vary: Origin
Content-Length: 379</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-11-24T23:47:34.700Z",
    "slotter" : {
      "id" : 65,
      "username" : "User 346",
      "createdAt" : "2015-11-24T23:47:34.698Z",
      "updatedAt" : "2015-11-24T23:47:34.698Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2015-11-24T23:47:34.742Z",
    "slotter" : {
      "id" : 68,
      "username" : "User 350",
      "createdAt" : "2015-11-24T23:47:34.741Z",
      "updatedAt" : "2015-11-24T23:47:34.741Z",
      "deletedAt" : null,
      "image" : ""
    }
  }
]
```
