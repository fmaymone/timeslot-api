# Me API

## Get active slots - no pagination

### GET /v1/me/slots

Returns an array which includes all Slots the current user is tagged to or which are in a calendar the current user is subscribed to.

The slots are ordered by startdate, enddate, ID.

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

<pre>Authorization: Token token=_hvexMXJzcjXLwGNwv9obu5u1_s
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/slots</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/slots&quot; -X GET \
	-H &quot;Authorization: Token token=_hvexMXJzcjXLwGNwv9obu5u1_s&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;8822eb0e6a634b4e058c0a2d57f47a0b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b1c09077-3bcf-46ce-a68e-3cc7f507e711
X-Runtime: 0.060701
Content-Length: 2921</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 20,
    "title" : "Slot title 22",
    "description" : "",
    "startDate" : "2019-09-23T22:44:02.000Z",
    "rrule" : "",
    "createdAt" : "2016-12-11T19:48:27.262Z",
    "updatedAt" : "2016-12-11T19:48:27.262Z",
    "deletedAt" : null,
    "endDate" : "2019-10-23T22:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 49,
      "username" : "User 47",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-12-11T19:48:27.257Z",
      "updatedAt" : "2016-12-11T19:48:27.257Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "private",
    "likerIds" : [],
    "likes" : 0,
    "commentsCounter" : 0,
    "firstGroup" : {
      "id" : "864447b2-c5f3-41c5-9229-246f129f479c",
      "name" : "Private",
      "image" : "",
      "description" : null,
      "defaultColor" : "000000",
      "membersCanPost" : false,
      "membersCanInvite" : false,
      "public" : false,
      "createdAt" : "2016-12-11T19:48:27.244Z",
      "updatedAt" : "2016-12-11T19:48:27.244Z",
      "deletedAt" : null,
      "owner" : {
        "id" : 48,
        "username" : "User 46",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-12-11T19:48:27.241Z",
        "updatedAt" : "2016-12-11T19:48:27.241Z",
        "deletedAt" : null,
        "image" : ""
      },
      "memberIds" : [
        48
      ],
      "memberCount" : 1,
      "slotCount" : 2
    },
    "slotGroupUuids" : [
      "864447b2-c5f3-41c5-9229-246f129f479c"
    ]
  },
  {
    "id" : 21,
    "title" : "Slot title 23",
    "description" : "",
    "startDate" : "2019-09-24T23:44:02.000Z",
    "rrule" : "",
    "createdAt" : "2016-12-11T19:48:27.275Z",
    "updatedAt" : "2016-12-11T19:48:27.275Z",
    "deletedAt" : null,
    "endDate" : "2019-10-24T23:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 50,
      "username" : "User 48",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-12-11T19:48:27.270Z",
      "updatedAt" : "2016-12-11T19:48:27.270Z",
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
    "firstGroup" : {
      "id" : "864447b2-c5f3-41c5-9229-246f129f479c",
      "name" : "Private",
      "image" : "",
      "description" : null,
      "defaultColor" : "000000",
      "membersCanPost" : false,
      "membersCanInvite" : false,
      "public" : false,
      "createdAt" : "2016-12-11T19:48:27.244Z",
      "updatedAt" : "2016-12-11T19:48:27.244Z",
      "deletedAt" : null,
      "owner" : {
        "id" : 48,
        "username" : "User 46",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-12-11T19:48:27.241Z",
        "updatedAt" : "2016-12-11T19:48:27.241Z",
        "deletedAt" : null,
        "image" : ""
      },
      "memberIds" : [
        48
      ],
      "memberCount" : 1,
      "slotCount" : 2
    },
    "slotGroupUuids" : [
      "864447b2-c5f3-41c5-9229-246f129f479c"
    ]
  },
  {
    "id" : 22,
    "title" : "Slot title 24",
    "description" : "",
    "startDate" : "2019-09-25T00:44:02.000Z",
    "rrule" : "",
    "createdAt" : "2016-12-11T19:48:27.297Z",
    "updatedAt" : "2016-12-11T19:48:27.297Z",
    "deletedAt" : null,
    "endDate" : "2019-10-25T00:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 51,
      "username" : "User 49",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-12-11T19:48:27.289Z",
      "updatedAt" : "2016-12-11T19:48:27.289Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "private",
    "likerIds" : [],
    "likes" : 0,
    "commentsCounter" : 0,
    "firstGroup" : null,
    "slotGroupUuids" : []
  }
]
```
