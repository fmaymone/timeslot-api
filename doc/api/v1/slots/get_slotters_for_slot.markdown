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

<pre>Authorization: Token token=2h9VCmcrdLFcP__lq6O52N5kKJI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/21/slotters</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/21/slotters&quot; -X GET \
	-H &quot;Authorization: Token token=2h9VCmcrdLFcP__lq6O52N5kKJI&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;1509bef499962ee1108976b61d6a034a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 27e8d4c0-6664-4ac7-b4c2-348b59cabd7f
X-Runtime: 0.008566
Vary: Origin
Content-Length: 379</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-12-23T11:18:35.761Z",
    "slotter" : {
      "id" : 65,
      "username" : "User 355",
      "createdAt" : "2015-12-23T11:18:35.759Z",
      "updatedAt" : "2015-12-23T11:18:35.759Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2015-12-23T11:18:35.808Z",
    "slotter" : {
      "id" : 68,
      "username" : "User 359",
      "createdAt" : "2015-12-23T11:18:35.806Z",
      "updatedAt" : "2015-12-23T11:18:35.806Z",
      "deletedAt" : null,
      "image" : ""
    }
  }
]
```
