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

<pre>Authorization: Token token=VMxNMXsWuLOBTSEmHcnEygYY2vo
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/52/history</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/slots/52/history&quot; -X GET \
	-H &quot;Authorization: Token token=VMxNMXsWuLOBTSEmHcnEygYY2vo&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;79380561ffe96dc5f5b148a4d9602414&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 45d4ab7e-3e63-4f52-b657-6fededf22e6c
X-Runtime: 0.080455
Content-Length: 266</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "predecessors" : [
    {
      "id" : 214,
      "username" : "User 211",
      "userImage" : null,
      "timestamp" : "2015-05-22T15:50:02.817Z"
    },
    {
      "id" : 213,
      "username" : "User 210",
      "userImage" : null,
      "timestamp" : "2015-05-22T15:50:02.811Z"
    }
  ],
  "parentUserId" : 212,
  "parentUsername" : "User 209",
  "parentUserImage" : null
}
```
