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

<pre>Authorization: Token token=ahfs_Ss-0sxcEk6onyCbOobf1jQ
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/29/comments</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/29/comments&quot; -X GET \
	-H &quot;Authorization: Token token=ahfs_Ss-0sxcEk6onyCbOobf1jQ&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;f4759e3ee434da5574dde26d73f937f0&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 06d38666-d0f4-403b-b2b8-6463ed0848ad
X-Runtime: 0.011556
Vary: Origin
Content-Length: 697</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "createdAt" : "2016-04-04T20:50:32.967Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 88,
      "username" : "User 390",
      "createdAt" : "2016-04-04T20:50:32.964Z",
      "updatedAt" : "2016-04-04T20:50:32.964Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2016-04-04T20:50:32.972Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 89,
      "username" : "User 391",
      "createdAt" : "2016-04-04T20:50:32.970Z",
      "updatedAt" : "2016-04-04T20:50:32.970Z",
      "deletedAt" : null,
      "image" : ""
    }
  },
  {
    "createdAt" : "2016-04-04T20:50:32.978Z",
    "content" : "hate no one, love only a few",
    "commenter" : {
      "id" : 90,
      "username" : "User 392",
      "createdAt" : "2016-04-04T20:50:32.975Z",
      "updatedAt" : "2016-04-04T20:50:32.975Z",
      "deletedAt" : null,
      "image" : ""
    }
  }
]
```
