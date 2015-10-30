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

<pre>Authorization: Token token=_3F2uJUrGjAMH6yexj8dfnu_0Rk
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/21/slotters</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/21/slotters&quot; -X GET \
	-H &quot;Authorization: Token token=_3F2uJUrGjAMH6yexj8dfnu_0Rk&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;89f75bb774238e973becd015dc63a337&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c26ed3fc-ee36-4c3c-baa2-00e64b5d568d
X-Runtime: 0.012817
Vary: Origin
Content-Length: 439</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-10-30T15:01:05.528Z",
    "slotter" : {
      "id" : 67,
      "username" : "User 284",
      "createdAt" : "2015-10-30T15:01:05.527Z",
      "updatedAt" : "2015-10-30T15:01:05.527Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-10-30T15:01:05.543Z",
    "slotter" : {
      "id" : 70,
      "username" : "User 288",
      "createdAt" : "2015-10-30T15:01:05.541Z",
      "updatedAt" : "2015-10-30T15:01:05.541Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  }
]
```
