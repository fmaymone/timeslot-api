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

<pre>Authorization: Token token=jGWiaacDShjiMi2tTpDEMVwczxM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/30/slotters</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/30/slotters&quot; -X GET \
	-H &quot;Authorization: Token token=jGWiaacDShjiMi2tTpDEMVwczxM&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;c78e9a171b482c1f495527914785b2ab&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6ae44f43-e9b4-44a1-a0e9-c42c19e64693
X-Runtime: 0.011486
Vary: Origin
Content-Length: 301</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "slotter" : {
      "id" : 94,
      "username" : "User 396",
      "createdAt" : "2016-04-04T20:50:33.019Z",
      "updatedAt" : "2016-04-04T20:50:33.019Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "slotter" : {
      "id" : 95,
      "username" : "User 397",
      "createdAt" : "2016-04-04T20:50:33.024Z",
      "updatedAt" : "2016-04-04T20:50:33.024Z",
      "deletedAt" : null,
      "image" : ""
    }
  }
]
```
