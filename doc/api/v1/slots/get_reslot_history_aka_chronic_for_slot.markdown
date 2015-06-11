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

<pre>Authorization: Token token=HC1xRULnPipktn4bBDOYGbUGvCE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/55/history</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/55/history&quot; -X GET \
	-H &quot;Authorization: Token token=HC1xRULnPipktn4bBDOYGbUGvCE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;df2da9deb1a9cd3f13b7fbb8c8ac8814&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a4026555-d3ab-41a2-9ca9-182247c34a4c
X-Runtime: 0.028673
Content-Length: 375</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "predecessors" : [
    {
      "id" : 217,
      "username" : "User 214",
      "userImage" : null,
      "timestamp" : "2015-06-11T16:20:56.316Z"
    },
    {
      "id" : 216,
      "username" : "User 213",
      "userImage" : null,
      "timestamp" : "2015-06-11T16:20:56.306Z"
    }
  ],
  "parentUser" : {
    "id" : 215,
    "username" : "User 212",
    "createdAt" : "2015-06-11T16:20:56.294Z",
    "updatedAt" : "2015-06-11T16:20:56.294Z",
    "deletedAt" : null,
    "image" : {
      "clyid" : null,
      "localId" : null
    }
  }
}
```
