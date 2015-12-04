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

<pre>Authorization: Token token=MZk1Tp-zdqJQOV2Zere3iLA80Dk
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/21/slotters</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/21/slotters&quot; -X GET \
	-H &quot;Authorization: Token token=MZk1Tp-zdqJQOV2Zere3iLA80Dk&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;7b8aaeb4fd4b00f44f05a39c99ae2234&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 0567ead7-f3b8-4241-b109-1c0f906db528
X-Runtime: 0.009841
Vary: Origin
Content-Length: 379</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-12-04T16:56:53.350Z",
    "slotter" : {
      "id" : 65,
      "username" : "User 348",
      "createdAt" : "2015-12-04T16:56:53.348Z",
      "updatedAt" : "2015-12-04T16:56:53.348Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2015-12-04T16:56:53.399Z",
    "slotter" : {
      "id" : 68,
      "username" : "User 352",
      "createdAt" : "2015-12-04T16:56:53.398Z",
      "updatedAt" : "2015-12-04T16:56:53.398Z",
      "deletedAt" : null,
      "image" : ""
    }
  }
]
```
