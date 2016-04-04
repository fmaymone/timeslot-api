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

<pre>Authorization: Token token=svVIbMpSngXG7UzpL8NrK1aajF8
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/27/likes</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/27/likes&quot; -X GET \
	-H &quot;Authorization: Token token=svVIbMpSngXG7UzpL8NrK1aajF8&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;a86b69438e231da3d63bb167aec62dc7&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4be32502-b65b-4799-befb-49d15ec7c4b0
X-Runtime: 0.010261
Vary: Origin
Content-Length: 749</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2016-04-04T20:50:32.828Z",
    "liker" : {
      "id" : 73,
      "username" : "User 375",
      "createdAt" : "2016-04-04T20:50:32.796Z",
      "updatedAt" : "2016-04-04T20:50:32.796Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2016-04-04T20:50:32.812Z",
    "liker" : {
      "id" : 76,
      "username" : "User 378",
      "createdAt" : "2016-04-04T20:50:32.809Z",
      "updatedAt" : "2016-04-04T20:50:32.809Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2016-04-04T20:50:32.818Z",
    "liker" : {
      "id" : 77,
      "username" : "User 379",
      "createdAt" : "2016-04-04T20:50:32.815Z",
      "updatedAt" : "2016-04-04T20:50:32.815Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2016-04-04T20:50:32.824Z",
    "liker" : {
      "id" : 78,
      "username" : "User 380",
      "createdAt" : "2016-04-04T20:50:32.822Z",
      "updatedAt" : "2016-04-04T20:50:32.822Z",
      "deletedAt" : null,
      "image" : ""
    }
  }
]
```
