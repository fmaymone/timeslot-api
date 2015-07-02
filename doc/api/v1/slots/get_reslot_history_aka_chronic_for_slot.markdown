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

<pre>Authorization: Token token=9Gs-F3nLZdtzNckZVALjU0Rdk6U
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/56/history</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/56/history&quot; -X GET \
	-H &quot;Authorization: Token token=9Gs-F3nLZdtzNckZVALjU0Rdk6U&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;096b6e7e7ac0bc348835d7eea2ded0b7&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7705f1f5-bdf0-4aaf-8805-3a2ed4e7f8ce
X-Runtime: 0.026478
Content-Length: 378</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "predecessors" : [
    {
      "id" : 231,
      "username" : "User 216",
      "userImage" : null,
      "timestamp" : "2015-07-02T12:34:20.588Z"
    },
    {
      "id" : 230,
      "username" : "User 215",
      "userImage" : null,
      "timestamp" : "2015-07-02T12:34:20.579Z"
    }
  ],
  "parentUser" : {
    "id" : 229,
    "username" : "User 214",
    "createdAt" : "2015-07-02T12:34:20.570Z",
    "updatedAt" : "2015-07-02T12:34:20.570Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  }
}
```
