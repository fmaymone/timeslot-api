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

<pre>Authorization: Token token=dukjjzysT_8U6Rmweng4FT6xLLI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/18/likes</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/18/likes&quot; -X GET \
	-H &quot;Authorization: Token token=dukjjzysT_8U6Rmweng4FT6xLLI&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;11e8112121f72695c8d7006c89856381&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7094c346-b009-4ba0-9d25-3c789bc35ec9
X-Runtime: 0.012755
Vary: Origin
Content-Length: 749</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-12-23T11:18:35.520Z",
    "liker" : {
      "id" : 43,
      "username" : "User 334",
      "createdAt" : "2015-12-23T11:18:35.517Z",
      "updatedAt" : "2015-12-23T11:18:35.517Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2015-12-23T11:18:35.526Z",
    "liker" : {
      "id" : 44,
      "username" : "User 335",
      "createdAt" : "2015-12-23T11:18:35.524Z",
      "updatedAt" : "2015-12-23T11:18:35.524Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2015-12-23T11:18:35.532Z",
    "liker" : {
      "id" : 45,
      "username" : "User 336",
      "createdAt" : "2015-12-23T11:18:35.529Z",
      "updatedAt" : "2015-12-23T11:18:35.529Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2015-12-23T11:18:35.550Z",
    "liker" : {
      "id" : 47,
      "username" : "User 338",
      "createdAt" : "2015-12-23T11:18:35.545Z",
      "updatedAt" : "2015-12-23T11:18:35.545Z",
      "deletedAt" : null,
      "image" : ""
    }
  }
]
```
