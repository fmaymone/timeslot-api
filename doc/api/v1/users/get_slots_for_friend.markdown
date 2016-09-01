# Users API

## Get slots for Friend

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots with visibility &#39;friend&#39;, &#39;foaf&#39; (friend-of-friend) or &#39;public&#39;, ReSlots &amp; shared GroupSlots

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

<pre>Authorization: Token token=MLXCd-bln-tncl8zCFYrXRobfpQ
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/152/slots</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/152/slots&quot; -X GET \
	-H &quot;Authorization: Token token=MLXCd-bln-tncl8zCFYrXRobfpQ&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;932a27277fd947d2f5c92fd2fc1d76bf&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 46eb8e77-9de0-467e-9b4c-a41c8c810cd6
X-Runtime: 0.062412
Content-Length: 1776</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 65,
    "title" : "Slot title 221",
    "description" : "",
    "startDate" : "2019-09-06T05:44:02.000Z",
    "createdAt" : "2016-08-30T09:51:12.095Z",
    "updatedAt" : "2016-08-30T09:51:12.095Z",
    "deletedAt" : null,
    "endDate" : "2019-10-06T05:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 152,
      "username" : "Joe",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-08-30T09:51:12.077Z",
      "updatedAt" : "2016-08-30T09:51:12.077Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "friends",
    "likerIds" : [],
    "likes" : 0,
    "commentsCounter" : 0,
    "firstGroup" : null,
    "slotGroupUuids" : []
  },
  {
    "id" : 66,
    "title" : "Slot title 222",
    "description" : "",
    "startDate" : "2019-09-07T06:44:02.000Z",
    "createdAt" : "2016-08-30T09:51:12.105Z",
    "updatedAt" : "2016-08-30T09:51:12.105Z",
    "deletedAt" : null,
    "endDate" : "2019-10-07T06:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 152,
      "username" : "Joe",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-08-30T09:51:12.077Z",
      "updatedAt" : "2016-08-30T09:51:12.077Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "foaf",
    "likerIds" : [],
    "likes" : 0,
    "commentsCounter" : 0,
    "firstGroup" : null,
    "slotGroupUuids" : []
  },
  {
    "id" : 67,
    "title" : "Slot title 223",
    "description" : "",
    "startDate" : "2019-09-08T07:44:02.000Z",
    "createdAt" : "2016-08-30T09:51:12.114Z",
    "updatedAt" : "2016-08-30T09:51:12.114Z",
    "deletedAt" : null,
    "endDate" : "2019-10-08T07:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 152,
      "username" : "Joe",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-08-30T09:51:12.077Z",
      "updatedAt" : "2016-08-30T09:51:12.077Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "public",
    "likerIds" : [],
    "likes" : 0,
    "commentsCounter" : 0,
    "firstGroup" : null,
    "slotGroupUuids" : []
  }
]
```
