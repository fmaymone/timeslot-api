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

<pre>Authorization: Token token=MsoPXaxAOdDHFtDCoSmiPBcCxdY
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/50/likes</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/50/likes&quot; -X GET \
	-H &quot;Authorization: Token token=MsoPXaxAOdDHFtDCoSmiPBcCxdY&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;b6c87e84f008af9899a51660fe65d8bd&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f89730b4-1b52-42aa-940f-c388b6b85cb7
X-Runtime: 0.027440
Content-Length: 881</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-06-16T15:49:59.669Z",
    "liker" : {
      "id" : 198,
      "username" : "User 195",
      "createdAt" : "2015-06-16T15:49:59.667Z",
      "updatedAt" : "2015-06-16T15:49:59.667Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-06-16T15:49:59.674Z",
    "liker" : {
      "id" : 199,
      "username" : "User 196",
      "createdAt" : "2015-06-16T15:49:59.671Z",
      "updatedAt" : "2015-06-16T15:49:59.671Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-06-16T15:49:59.678Z",
    "liker" : {
      "id" : 200,
      "username" : "User 197",
      "createdAt" : "2015-06-16T15:49:59.676Z",
      "updatedAt" : "2015-06-16T15:49:59.676Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-06-16T15:49:59.761Z",
    "liker" : {
      "id" : 202,
      "username" : "User 199",
      "createdAt" : "2015-06-16T15:49:59.755Z",
      "updatedAt" : "2015-06-16T15:49:59.755Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : "dfhjghjkdisudgfds7iy37",
        "localId" : null
      }
    }
  }
]
```
