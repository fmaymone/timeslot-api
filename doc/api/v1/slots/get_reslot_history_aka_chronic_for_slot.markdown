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

<pre>Authorization: Token token=HevAfr3aoWZfFPAy3W6wQjpJn8I
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/30/history</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/30/history&quot; -X GET \
	-H &quot;Authorization: Token token=HevAfr3aoWZfFPAy3W6wQjpJn8I&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;9e9da71309bafea4a0a10d3f76b5057d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: fab03e0f-097e-4b31-8260-95e0ea11b8ff
X-Runtime: 0.014640
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
      "username" : "User 379",
      "userImage" : "",
      "timestamp" : "2015-12-23T11:18:36.035Z"
    },
    {
      "id" : 82,
      "username" : "User 377",
      "userImage" : "",
      "timestamp" : "2015-12-23T11:18:35.989Z"
    }
  ],
  "parentUser" : {
    "id" : 80,
    "username" : "User 375",
    "createdAt" : "2015-12-23T11:18:35.976Z",
    "updatedAt" : "2015-12-23T11:18:35.976Z",
    "deletedAt" : null,
    "image" : ""
  }
}
```
