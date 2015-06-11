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

<pre>Authorization: Token token=oCxDe35r126fWzBgdRLfzNk_T4I
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/49/likes</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/49/likes&quot; -X GET \
	-H &quot;Authorization: Token token=oCxDe35r126fWzBgdRLfzNk_T4I&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;a26da6927d495891188cf2ce26a309d2&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f04b2c5b-ada3-4ffa-b4c2-c29885d99a48
X-Runtime: 0.029571
Content-Length: 881</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-06-11T16:20:55.865Z",
    "liker" : {
      "id" : 196,
      "username" : "User 193",
      "createdAt" : "2015-06-11T16:20:55.862Z",
      "updatedAt" : "2015-06-11T16:20:55.862Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-06-11T16:20:55.870Z",
    "liker" : {
      "id" : 197,
      "username" : "User 194",
      "createdAt" : "2015-06-11T16:20:55.867Z",
      "updatedAt" : "2015-06-11T16:20:55.867Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-06-11T16:20:55.874Z",
    "liker" : {
      "id" : 198,
      "username" : "User 195",
      "createdAt" : "2015-06-11T16:20:55.872Z",
      "updatedAt" : "2015-06-11T16:20:55.872Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-06-11T16:20:55.958Z",
    "liker" : {
      "id" : 200,
      "username" : "User 197",
      "createdAt" : "2015-06-11T16:20:55.953Z",
      "updatedAt" : "2015-06-11T16:20:55.953Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : "dfhjghjkdisudgfds7iy37",
        "localId" : null
      }
    }
  }
]
```
