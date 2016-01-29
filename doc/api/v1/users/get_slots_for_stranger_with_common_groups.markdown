# Users API

## Get slots for Stranger with common groups

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots with visibility &#39;public&#39;, &#39;public&#39;-ReSlots &amp; shared GroupSlots

If a user is authenticated the slot settings (alerts) will be included.

### Parameters

Name : id
Description : ID of the user to get the slots for.


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

<pre>Authorization: Token token=CF369QM_7DYWz4Ndgvuhm4oXtug
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/193/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/193/slots&quot; -X GET \
	-H &quot;Authorization: Token token=CF369QM_7DYWz4Ndgvuhm4oXtug&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;a2f6a7b3580aec0d627bdaca18fdc7a4&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a6f728f2-78e7-4e28-a537-40c6cbced3c2
X-Runtime: 0.044659
Vary: Origin
Content-Length: 1033</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 86,
    "title" : "Slot title 169",
    "startDate" : "2019-09-12T05:44:02.000Z",
    "createdAt" : "2016-01-29T19:39:19.335Z",
    "updatedAt" : "2016-01-29T19:39:19.335Z",
    "deletedAt" : null,
    "endDate" : "2019-10-12T05:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 197,
      "username" : "User 528",
      "createdAt" : "2016-01-29T19:39:19.325Z",
      "updatedAt" : "2016-01-29T19:39:19.325Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "public",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0
  },
  {
    "id" : 88,
    "title" : "Slot title 170",
    "startDate" : "2019-09-13T06:44:02.000Z",
    "createdAt" : "2016-01-29T19:39:19.369Z",
    "updatedAt" : "2016-01-29T19:39:19.369Z",
    "deletedAt" : null,
    "endDate" : "2019-10-13T06:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 198,
      "username" : "User 529",
      "createdAt" : "2016-01-29T19:39:19.339Z",
      "updatedAt" : "2016-01-29T19:39:19.339Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "public",
    "reslotsCounter" : 1,
    "slotter" : {
      "id" : 193
    },
    "parent" : {
      "id" : 87
    },
    "likes" : 0,
    "commentsCounter" : 0
  }
]
```
