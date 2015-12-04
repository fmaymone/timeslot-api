# Users API

## Get slots for Stranger

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots with visibility &#39;public&#39; and &#39;public&#39;-ReSlots

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

<pre>Authorization: Token token=h8_wSlN9farScYjvbGfdpTkETLw
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/201/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/201/slots&quot; -X GET \
	-H &quot;Authorization: Token token=h8_wSlN9farScYjvbGfdpTkETLw&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;0ce9f419fb7110c2a2f1cd91d6b55131&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c40d96d6-82d3-488d-919d-18a5203b82e7
X-Runtime: 0.030677
Vary: Origin
Content-Length: 1065</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 96,
    "title" : "Slot title 156",
    "startDate" : "2019-09-26T16:44:02.000Z",
    "createdAt" : "2015-12-04T16:56:55.901Z",
    "updatedAt" : "2015-12-04T16:56:55.901Z",
    "deletedAt" : null,
    "endDate" : "2019-10-26T16:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 205,
      "username" : "User 487",
      "createdAt" : "2015-12-04T16:56:55.896Z",
      "updatedAt" : "2015-12-04T16:56:55.896Z",
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
    "commentsCounter" : 0,
    "shareUrl" : null
  },
  {
    "id" : 98,
    "title" : "Slot title 157",
    "startDate" : "2019-09-27T17:44:02.000Z",
    "createdAt" : "2015-12-04T16:56:55.919Z",
    "updatedAt" : "2015-12-04T16:56:55.919Z",
    "deletedAt" : null,
    "endDate" : "2019-10-27T17:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 206,
      "username" : "User 488",
      "createdAt" : "2015-12-04T16:56:55.903Z",
      "updatedAt" : "2015-12-04T16:56:55.903Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "reslotsCounter" : 1,
    "slotter" : {
      "id" : 201
    },
    "parent" : {
      "id" : 97
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  }
]
```
