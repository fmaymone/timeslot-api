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

<pre>Authorization: Token token=RX11PQMmi7xroFRZDoWZ-6GL-8Y
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/30/likes</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/30/likes&quot; -X GET \
	-H &quot;Authorization: Token token=RX11PQMmi7xroFRZDoWZ-6GL-8Y&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;59c4b74fc742caecbe29a0d654fe72af&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2dba60dc-7510-4794-b50e-7af77b9e17b4
X-Runtime: 0.016226
Content-Length: 953</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2016-08-30T09:51:10.173Z",
    "liker" : {
      "id" : 71,
      "username" : "User 785",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-08-30T09:51:10.139Z",
      "updatedAt" : "2016-08-30T09:51:10.139Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2016-08-30T09:51:10.157Z",
    "liker" : {
      "id" : 73,
      "username" : "User 788",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-08-30T09:51:10.154Z",
      "updatedAt" : "2016-08-30T09:51:10.154Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2016-08-30T09:51:10.163Z",
    "liker" : {
      "id" : 74,
      "username" : "User 789",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-08-30T09:51:10.160Z",
      "updatedAt" : "2016-08-30T09:51:10.160Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2016-08-30T09:51:10.170Z",
    "liker" : {
      "id" : 75,
      "username" : "User 790",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-08-30T09:51:10.166Z",
      "updatedAt" : "2016-08-30T09:51:10.166Z",
      "deletedAt" : null,
      "image" : ""
    }
  }
]
```
