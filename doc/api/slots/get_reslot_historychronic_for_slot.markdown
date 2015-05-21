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

<pre>Authorization: Token token=dIAdWX4mj-QWL-ozAO4kvVGpfRI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/52/history</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/slots/52/history&quot; -X GET \
	-H &quot;Authorization: Token token=dIAdWX4mj-QWL-ozAO4kvVGpfRI&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;b5a7fa005180bff344172b4ef82f4b33&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: df2196d0-5a45-40f4-be0c-fc70fb6a395b
X-Runtime: 0.023068
Content-Length: 266</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "predecessors" : [
    {
      "id" : 213,
      "username" : "User 210",
      "userImage" : null,
      "timestamp" : "2015-05-19T10:51:51.766Z"
    },
    {
      "id" : 212,
      "username" : "User 209",
      "userImage" : null,
      "timestamp" : "2015-05-19T10:51:51.760Z"
    }
  ],
  "parentUserId" : 211,
  "parentUsername" : "User 208",
  "parentUserImage" : null
}
```
