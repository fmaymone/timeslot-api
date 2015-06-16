# Slots API

## Get Reslot History aka Chronic for Slot

### GET /v1/slots/:id/history

returns list of all previous reslots for the slot. Includes User data and timestamp.

returns 401 if User not allowed to see reslot history

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the Slot to get the chronic for


### Response Fields

Name : predecessors
Description : Array of Users who had (re-)slottet that slot before

Name : parentUserId
Description : ID of the creator of the original slot

Name : parentUsername
Description : Username of the creator of the original slot

Name : parentUserImage
Description : Image of the creator of the original slot

### Request

#### Headers

<pre>Authorization: Token token=DLQpoe_a9E_xsaBJRZHb3n2upM0
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/56/history</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/56/history&quot; -X GET \
	-H &quot;Authorization: Token token=DLQpoe_a9E_xsaBJRZHb3n2upM0&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;a1610bb738dd422736880d7f4d362236&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ac5d3153-7b5d-43f5-b63f-6e98055ce5c0
X-Runtime: 0.027746
Content-Length: 375</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "predecessors" : [
    {
      "id" : 219,
      "username" : "User 216",
      "userImage" : null,
      "timestamp" : "2015-06-16T15:50:00.084Z"
    },
    {
      "id" : 218,
      "username" : "User 215",
      "userImage" : null,
      "timestamp" : "2015-06-16T15:50:00.077Z"
    }
  ],
  "parentUser" : {
    "id" : 217,
    "username" : "User 214",
    "createdAt" : "2015-06-16T15:50:00.071Z",
    "updatedAt" : "2015-06-16T15:50:00.071Z",
    "deletedAt" : null,
    "image" : {
      "clyid" : null,
      "localId" : null
    }
  }
}
```
