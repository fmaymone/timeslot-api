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

<pre>Authorization: Token token=6_wuAKUoaYsxhA3iDxIfPdYCtZo
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/52/history</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/slots/52/history&quot; -X GET \
	-H &quot;Authorization: Token token=6_wuAKUoaYsxhA3iDxIfPdYCtZo&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;e52bb1e6b7f38c474034ef3bf3e29f2c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 09188281-46e4-47ce-b9f9-6363feb84e98
X-Runtime: 0.045150
Content-Length: 266</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "predecessors" : [
    {
      "id" : 203,
      "username" : "User 203",
      "userImage" : null,
      "timestamp" : "2015-05-06T21:29:38.376Z"
    },
    {
      "id" : 202,
      "username" : "User 202",
      "userImage" : null,
      "timestamp" : "2015-05-06T21:29:38.370Z"
    }
  ],
  "parentUserId" : 201,
  "parentUsername" : "User 201",
  "parentUserImage" : null
}
```
