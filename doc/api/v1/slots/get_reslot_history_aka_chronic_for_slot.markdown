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

<pre>Authorization: Token token=788TXFG7QTwScM7WBM-nuI6ORq4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/30/history</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/30/history&quot; -X GET \
	-H &quot;Authorization: Token token=788TXFG7QTwScM7WBM-nuI6ORq4&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;1c754d20d86a340f9f0c5fda501cd1a0&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2b04d284-403f-44e2-a3e1-f5f63a41e137
X-Runtime: 0.014186
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
      "username" : "User 365",
      "userImage" : "",
      "timestamp" : "2015-11-17T23:46:16.661Z"
    },
    {
      "id" : 82,
      "username" : "User 363",
      "userImage" : "",
      "timestamp" : "2015-11-17T23:46:16.649Z"
    }
  ],
  "parentUser" : {
    "id" : 80,
    "username" : "User 361",
    "createdAt" : "2015-11-17T23:46:16.637Z",
    "updatedAt" : "2015-11-17T23:46:16.637Z",
    "deletedAt" : null,
    "image" : ""
  }
}
```
