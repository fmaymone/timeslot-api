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

<pre>Authorization: Token token=P1wH0wT5KRQmyiXAvLtFbQ33aYI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/21/slotters</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/21/slotters&quot; -X GET \
	-H &quot;Authorization: Token token=P1wH0wT5KRQmyiXAvLtFbQ33aYI&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;0bf2c72f4fdc8859cded6ca6a819244e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 66f9b08f-229f-4590-b3c3-00179e68eadf
X-Runtime: 0.013515
Vary: Origin
Content-Length: 379</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-11-17T23:46:16.525Z",
    "slotter" : {
      "id" : 65,
      "username" : "User 341",
      "createdAt" : "2015-11-17T23:46:16.523Z",
      "updatedAt" : "2015-11-17T23:46:16.523Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2015-11-17T23:46:16.539Z",
    "slotter" : {
      "id" : 68,
      "username" : "User 345",
      "createdAt" : "2015-11-17T23:46:16.537Z",
      "updatedAt" : "2015-11-17T23:46:16.537Z",
      "deletedAt" : null,
      "image" : ""
    }
  }
]
```
