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

<pre>Authorization: Token token=-I4B-rMigvYb0PE3uWqtyP0Cy_g
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/50/likes</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/50/likes&quot; -X GET \
	-H &quot;Authorization: Token token=-I4B-rMigvYb0PE3uWqtyP0Cy_g&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;ef2ce896376e330d989239fe68a03009&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 863a0bb9-f9d2-4f55-b612-4f65c4b3a6be
X-Runtime: 0.026685
Content-Length: 893</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-07-02T12:34:20.320Z",
    "liker" : {
      "id" : 210,
      "username" : "User 195",
      "createdAt" : "2015-07-02T12:34:20.317Z",
      "updatedAt" : "2015-07-02T12:34:20.317Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-07-02T12:34:20.327Z",
    "liker" : {
      "id" : 211,
      "username" : "User 196",
      "createdAt" : "2015-07-02T12:34:20.323Z",
      "updatedAt" : "2015-07-02T12:34:20.323Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-07-02T12:34:20.333Z",
    "liker" : {
      "id" : 212,
      "username" : "User 197",
      "createdAt" : "2015-07-02T12:34:20.329Z",
      "updatedAt" : "2015-07-02T12:34:20.329Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-07-02T12:34:20.355Z",
    "liker" : {
      "id" : 214,
      "username" : "User 199",
      "createdAt" : "2015-07-02T12:34:20.348Z",
      "updatedAt" : "2015-07-02T12:34:20.348Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : "dfhjghjkdisudgfds7iy37",
        "localId" : null
      }
    }
  }
]
```
