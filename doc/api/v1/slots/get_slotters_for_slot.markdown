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

<pre>Authorization: Token token=J_vQSRJyrtO6uK7yRzbb3dhoVDc
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/25/slotters</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/25/slotters&quot; -X GET \
	-H &quot;Authorization: Token token=J_vQSRJyrtO6uK7yRzbb3dhoVDc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;04fe6d285675810d49dfea5c4d960fb7&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 29a146d4-a0a3-4077-aaf6-aefdd2c0fabe
X-Runtime: 0.012360
Vary: Origin
Content-Length: 379</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2016-01-29T19:39:16.262Z",
    "slotter" : {
      "id" : 85,
      "username" : "User 416",
      "createdAt" : "2016-01-29T19:39:16.260Z",
      "updatedAt" : "2016-01-29T19:39:16.260Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2016-01-29T19:39:16.312Z",
    "slotter" : {
      "id" : 88,
      "username" : "User 420",
      "createdAt" : "2016-01-29T19:39:16.310Z",
      "updatedAt" : "2016-01-29T19:39:16.310Z",
      "deletedAt" : null,
      "image" : ""
    }
  }
]
```
