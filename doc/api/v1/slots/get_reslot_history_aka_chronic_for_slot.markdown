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

<pre>Authorization: Token token=ux_VGjjaadvcUpDZ4WP5DMVbI-U
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/55/history</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/55/history&quot; -X GET \
	-H &quot;Authorization: Token token=ux_VGjjaadvcUpDZ4WP5DMVbI-U&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;225ed52ac5de3cdf3a7f254bd203f578&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8986c65c-066b-4c5a-b5bf-eda55b06792d
X-Runtime: 0.023187
Content-Length: 350</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "predecessors" : [
    {
      "id" : 264,
      "username" : "User 261",
      "userImage" : null,
      "timestamp" : "2015-06-03T10:39:39.835Z"
    },
    {
      "id" : 263,
      "username" : "User 260",
      "userImage" : null,
      "timestamp" : "2015-06-03T10:39:39.827Z"
    }
  ],
  "parentUser" : {
    "id" : 262,
    "username" : "User 259",
    "createdAt" : "2015-06-03T10:39:39.821Z",
    "updatedAt" : "2015-06-03T10:39:39.821Z",
    "deletedAt" : null,
    "image" : null
  }
}
```
