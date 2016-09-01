# Slots API

## Get Slotters for Slot

### GET /v1/slots/:id/slotters

returns a list of all users who have the slot in their calendar. For now there is no distinction between visibilities as backend has no support for this yet.

returns 401 if User not allowed to see Slotter data

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the Slot to get the slotters for


### Response Fields

Name : array
Description : list of all users who added the slot to their &#39;MyCalendar&#39;

### Request

#### Headers

<pre>Authorization: Token token=qZkFWGUzZ2X7N8H9DmtAMxuZ-tw
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/33/slotters</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/33/slotters&quot; -X GET \
	-H &quot;Authorization: Token token=qZkFWGUzZ2X7N8H9DmtAMxuZ-tw&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;d1b788e0bfb795587c8722a42f7bfff7&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 95adf2d6-de8f-489f-9c32-8147e59dd9e6
X-Runtime: 0.011260
Content-Length: 403</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "slotter" : {
      "id" : 88,
      "username" : "User 805",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-08-30T09:51:10.395Z",
      "updatedAt" : "2016-08-30T09:51:10.395Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "slotter" : {
      "id" : 89,
      "username" : "User 806",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-08-30T09:51:10.400Z",
      "updatedAt" : "2016-08-30T09:51:10.400Z",
      "deletedAt" : null,
      "image" : ""
    }
  }
]
```
