# Users API

## Get slots of unrelated user

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots with visibility &#39;public&#39; and &#39;public&#39;-ReSlots

If a user is authenticated the slot settings (alerts) will be included.

### Response Fields

Name : id
Description : ID of the slot

Name : title
Description : Title of the slot

Name : startDate
Description : Startdate of the slot

Name : endDate
Description : Enddate of the slot

Name : openEnd
Description : OpenEnd Boolean Flag of the slot

Name : creatorId
Description : ID of the User who created the slot

Name : alerts
Description : Alerts for the slot for the current user

Name : notes
Description : A list of all notes on the slot

Name : likes
Description : Number of likes for the slot

Name : commentsCounter
Description : Number of comments on the slot

Name : images
Description : Images for the slot

Name : audios
Description : Audio recordings for the slot

Name : videos
Description : Videos for the slot

Name : url
Description : direct url to fetch the slot

Name : visibility
Description : Visibility if it&#39;s a StandardSlot

Name : createdAt
Description : Creation datetime of the slot

Name : updatedAt
Description : Last update of the slot

Name : deletedAt
Description : Deletion datetime of the slot

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=hpNhNENpZXU5oHRXIE7aErgbpHA
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/300/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/300/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=hpNhNENpZXU5oHRXIE7aErgbpHA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;f22921622a27c1b4e91c9c5fe1e6149b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b6606b1b-3f3a-4fc7-a955-6a97e89a8600
X-Runtime: 0.063831
Content-Length: 1160</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 89,
    "title" : "Slot title 78",
    "startDate" : "2019-09-25T06:44:02.000Z",
    "endDate" : "2019-10-25T06:44:02.000Z",
    "createdAt" : "2015-07-02T12:34:26.682Z",
    "updatedAt" : "2015-07-02T12:34:26.682Z",
    "deletedAt" : null,
    "openEnd" : false,
    "location" : null,
    "creator" : {
      "id" : 303,
      "username" : "User 284",
      "createdAt" : "2015-07-02T12:34:26.676Z",
      "updatedAt" : "2015-07-02T12:34:26.676Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/89"
  },
  {
    "id" : 91,
    "title" : "Slot title 80",
    "startDate" : "2019-09-27T08:44:02.000Z",
    "endDate" : "2019-10-27T08:44:02.000Z",
    "createdAt" : "2015-07-02T12:34:26.696Z",
    "updatedAt" : "2015-07-02T12:34:26.716Z",
    "deletedAt" : null,
    "openEnd" : false,
    "location" : null,
    "creator" : {
      "id" : 306,
      "username" : "User 287",
      "createdAt" : "2015-07-02T12:34:26.699Z",
      "updatedAt" : "2015-07-02T12:34:26.699Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "slotter" : {
      "id" : 300
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/91"
  }
]
```
