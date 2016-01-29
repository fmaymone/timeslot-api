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

<pre>Authorization: Token token=ahxSM3Kjpde-ODmCPhMmsyHD7Lg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/34/history</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/34/history&quot; -X GET \
	-H &quot;Authorization: Token token=ahxSM3Kjpde-ODmCPhMmsyHD7Lg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;840e25a5e098c979003ce8329547c409&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4e3cd297-0564-4ee0-bb16-2339aa275df4
X-Runtime: 0.022181
Vary: Origin
Content-Length: 344</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "predecessors" : [
    {
      "id" : 104,
      "username" : "User 440",
      "userImage" : "",
      "timestamp" : "2016-01-29T19:39:16.675Z"
    },
    {
      "id" : 102,
      "username" : "User 438",
      "userImage" : "",
      "timestamp" : "2016-01-29T19:39:16.587Z"
    }
  ],
  "parentUser" : {
    "id" : 100,
    "username" : "User 436",
    "createdAt" : "2016-01-29T19:39:16.541Z",
    "updatedAt" : "2016-01-29T19:39:16.541Z",
    "deletedAt" : null,
    "image" : ""
  }
}
```
