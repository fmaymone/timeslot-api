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

<pre>Authorization: Token token=mh-jZ34aHUGMmugDuOBXxzDaLI4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/32/comments</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/32/comments&quot; -X GET \
	-H &quot;Authorization: Token token=mh-jZ34aHUGMmugDuOBXxzDaLI4&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;873c7ba06a1da1f0b483c5a1fe63a475&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ad696e97-00f1-4c09-a695-41a6cc063fd0
X-Runtime: 0.010073
Content-Length: 850</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2016-08-30T09:51:10.343Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 83,
      "username" : "User 799",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-08-30T09:51:10.337Z",
      "updatedAt" : "2016-08-30T09:51:10.337Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2016-08-30T09:51:10.353Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 84,
      "username" : "User 800",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-08-30T09:51:10.350Z",
      "updatedAt" : "2016-08-30T09:51:10.350Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2016-08-30T09:51:10.358Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 85,
      "username" : "User 801",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-08-30T09:51:10.356Z",
      "updatedAt" : "2016-08-30T09:51:10.356Z",
      "deletedAt" : null,
      "image" : ""
    }
  }
]
```
