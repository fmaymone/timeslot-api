# Slots API

## Get Reslot History/Chronic for Slot

### GET /v1/slots/:id/history

returns list of all previous reslots for the slot. Includes User data and timestamp.

returns 401 if User not allowed to see reslot history

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the Slot to get the chronic for

### Request

#### Headers

<pre>Authorization: Token token=mz5dbsXnAlW_lsSybef2py0NULQ
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/52/history</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/slots/52/history&quot; -X GET \
	-H &quot;Authorization: Token token=mz5dbsXnAlW_lsSybef2py0NULQ&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;c0f322051faf7db68a2687d954f5eccf&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c614d99f-0128-430e-80f3-563637ab58c4
X-Runtime: 0.025802
Content-Length: 266</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "predecessors" : [
    {
      "id" : 203,
      "username" : "User 203",
      "userImage" : null,
      "timestamp" : "2015-05-06T11:28:51.702Z"
    },
    {
      "id" : 202,
      "username" : "User 202",
      "userImage" : null,
      "timestamp" : "2015-05-06T11:28:51.698Z"
    }
  ],
  "parentUserId" : 201,
  "parentUsername" : "User 201",
  "parentUserImage" : null
}</pre>
