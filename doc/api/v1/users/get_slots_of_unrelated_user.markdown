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
Authorization: Token token=5EpPjLPPE6EvB15ZZrfSmZScWrU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/443/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/443/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=5EpPjLPPE6EvB15ZZrfSmZScWrU&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;dad6445f3fdb7b0ed511a473545f5528&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8ccbbd17-14c0-4f98-b199-c949766893b1
X-Runtime: 0.099693
Vary: Origin
Content-Length: 1171</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 137,
    "title" : "Slot title 124",
    "startDate" : "2019-09-17T04:44:02.000Z",
    "createdAt" : "2015-09-14T10:33:06.463Z",
    "updatedAt" : "2015-09-14T10:33:06.463Z",
    "deletedAt" : null,
    "endDate" : "2019-10-17T04:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 446,
      "username" : "User 407",
      "createdAt" : "2015-09-14T10:33:06.451Z",
      "updatedAt" : "2015-09-14T10:33:06.451Z",
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
    "url" : "http://example.org/v1/slots/137"
  },
  {
    "id" : 139,
    "title" : "Slot title 126",
    "startDate" : "2019-09-19T06:44:02.000Z",
    "createdAt" : "2015-09-14T10:33:06.481Z",
    "updatedAt" : "2015-09-14T10:33:06.503Z",
    "deletedAt" : null,
    "endDate" : "2019-10-19T06:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 443,
      "username" : "Joe",
      "createdAt" : "2015-09-14T10:33:06.428Z",
      "updatedAt" : "2015-09-14T10:33:06.428Z",
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
      "id" : 443
    },
    "parent" : {
      "id" : 140
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/139"
  }
]
```
