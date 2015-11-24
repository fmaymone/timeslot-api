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

<pre>Authorization: Token token=7qLS23Xuuq0Nlj79DufUyuDzeTg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/30/history</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/30/history&quot; -X GET \
	-H &quot;Authorization: Token token=7qLS23Xuuq0Nlj79DufUyuDzeTg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;c38a2a67623243c90b417a8ac8995bb7&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b86be82c-c25c-4206-a4dc-7ed8d3a82ba7
X-Runtime: 0.016309
Vary: Origin
Content-Length: 341</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "predecessors" : [
    {
      "id" : 84,
      "username" : "User 370",
      "userImage" : "",
      "timestamp" : "2015-11-24T23:47:34.966Z"
    },
    {
      "id" : 82,
      "username" : "User 368",
      "userImage" : "",
      "timestamp" : "2015-11-24T23:47:34.922Z"
    }
  ],
  "parentUser" : {
    "id" : 80,
    "username" : "User 366",
    "createdAt" : "2015-11-24T23:47:34.910Z",
    "updatedAt" : "2015-11-24T23:47:34.910Z",
    "deletedAt" : null,
    "image" : ""
  }
}
```
