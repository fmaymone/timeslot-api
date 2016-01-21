# Slots API

## Get Likes for Slot

### GET /v1/slots/:id/likes

returns a list of all likes for the slot. Includes User data and timestamp.

returns 401 if User not allowed to see Likes data

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the Slot to get the likes for


### Response Fields

Name : array
Description : containing creation date of the Like and details of the user who made the Like

### Request

#### Headers

<pre>Authorization: Token token=asbwBIsCrl00yan8mt_uPdorIX0
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/17/likes</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/17/likes&quot; -X GET \
	-H &quot;Authorization: Token token=asbwBIsCrl00yan8mt_uPdorIX0&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;070ebf9cc86b827f4531391e0db4ae9a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 0f443443-1231-4169-9938-a379b6f37eb5
X-Runtime: 0.015843
Vary: Origin
Content-Length: 749</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2016-01-21T23:11:41.499Z",
    "liker" : {
      "id" : 45,
      "username" : "User 344",
      "createdAt" : "2016-01-21T23:11:41.493Z",
      "updatedAt" : "2016-01-21T23:11:41.493Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2016-01-21T23:11:41.504Z",
    "liker" : {
      "id" : 46,
      "username" : "User 345",
      "createdAt" : "2016-01-21T23:11:41.502Z",
      "updatedAt" : "2016-01-21T23:11:41.502Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2016-01-21T23:11:41.510Z",
    "liker" : {
      "id" : 47,
      "username" : "User 346",
      "createdAt" : "2016-01-21T23:11:41.508Z",
      "updatedAt" : "2016-01-21T23:11:41.508Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2016-01-21T23:11:41.514Z",
    "liker" : {
      "id" : 42,
      "username" : "User 341",
      "createdAt" : "2016-01-21T23:11:41.477Z",
      "updatedAt" : "2016-01-21T23:11:41.477Z",
      "deletedAt" : null,
      "image" : ""
    }
  }
]
```
