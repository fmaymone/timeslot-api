# Slots API

## Get Comments for Slot

### GET /v1/slots/:id/comments

returns a list of all comments for the slot. Includes User data and timestamp.

returns 401 if User not allowed to see Comments data

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the Slot to get the comments for


### Response Fields

Name : array
Description : containing comment content and creation date and details of the user who made the comment

### Request

#### Headers

<pre>Authorization: Token token=Ue8SwljQtz4aM0Mh5NFVffnG9Dw
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/52/comments</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/52/comments&quot; -X GET \
	-H &quot;Authorization: Token token=Ue8SwljQtz4aM0Mh5NFVffnG9Dw&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;e43f900819f15cfd8f714c5a1f085a57&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 35c1d16e-38ab-4f35-8214-8ba8f0f53e52
X-Runtime: 0.026150
Content-Length: 1061</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2015-06-16T15:49:59.935Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 211,
      "username" : "User 208",
      "createdAt" : "2015-06-16T15:49:59.933Z",
      "updatedAt" : "2015-06-16T15:49:59.933Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-06-16T15:49:59.941Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 212,
      "username" : "User 209",
      "createdAt" : "2015-06-16T15:49:59.938Z",
      "updatedAt" : "2015-06-16T15:49:59.938Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-06-16T15:49:59.946Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 213,
      "username" : "User 210",
      "createdAt" : "2015-06-16T15:49:59.943Z",
      "updatedAt" : "2015-06-16T15:49:59.943Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : null,
        "localId" : null
      }
    }
  },
  {
    "createdAt" : "2015-06-16T15:50:00.030Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 215,
      "username" : "User 212",
      "createdAt" : "2015-06-16T15:50:00.025Z",
      "updatedAt" : "2015-06-16T15:50:00.025Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : "dfhjghjkdisudgfds7iy38",
        "localId" : null
      }
    }
  }
]
```
