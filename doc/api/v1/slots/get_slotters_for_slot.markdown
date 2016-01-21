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

<pre>Authorization: Token token=WFQ6bt0P6IAOaMLqRL6zUtMPoNU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/20/slotters</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/20/slotters&quot; -X GET \
	-H &quot;Authorization: Token token=WFQ6bt0P6IAOaMLqRL6zUtMPoNU&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;a70f4b076c7389a8a7e61db383255785&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2c0533bb-080c-446c-88ee-405703f21697
X-Runtime: 0.010853
Vary: Origin
Content-Length: 379</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2016-01-21T23:11:41.716Z",
    "slotter" : {
      "id" : 65,
      "username" : "User 363",
      "createdAt" : "2016-01-21T23:11:41.715Z",
      "updatedAt" : "2016-01-21T23:11:41.715Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2016-01-21T23:11:41.760Z",
    "slotter" : {
      "id" : 68,
      "username" : "User 367",
      "createdAt" : "2016-01-21T23:11:41.758Z",
      "updatedAt" : "2016-01-21T23:11:41.758Z",
      "deletedAt" : null,
      "image" : ""
    }
  }
]
```
