# Me API

## Get slots from friends

### GET /v1/me/friendslots

Returns an array which includes all non-private StandardSlots from all friends of the current user.

This endpoint supports pagination in the same style as the &#39;/me/slots&#39; route.

### Parameters

Name : limit
Description : Maximum number of slots returned. Default is 40. Maximum is 100.

Name : moment
Description : A point in time. Query parameter to get slots relative to a specific moment. Must be UTC.
Default is Time.zone.now (server time).

Name : filter
Description : Query parameter to reduce the set of valid slots which are taken into account for the db query. Must be one of:
- **between**: takes 2 additional parameters: *earliest* and *latest*. Will only return slots which overlap with the specified time interval. *Rule: startDate &lt; latest AND endDate &gt; earliest*. Default **mode** is &#39;now&#39;, default **moment** == &#39;earliest.&#39;
- **newer**: tba
Default is **none**.

Name : mode
Description : Query parameter to request slots relative to a given **moment**. Must be one of:
- **past**: *start* before *moment*
- **upcoming**: *start* after or equal *moment*
- **ongoing**: *start* before &amp; *end* after *moment*
- **finished**: *start* &amp; *end* before *moment*
- **now**: *ongoing* &amp; *upcoming* slots
- **around**: limit/2 slots with *start* before *moment* and limit/2 slots with *start* after *moment*. This might miss ongoing slots.
- **all**: no restriction
Default is **all**.

Name : before
Description : Pagination cursor to retrieve slots which do happen BEFORE the slot represented by this cursor. If a cursor is send, **mode** and **moment** are ignored.

Name : after
Description : Pagination cursor to retrieve slots which do happen AFTER the slot represented by this cursor. If a cursor is send, **mode** and **moment** are ignored.

Name : earliest
Description : A point in time. No results before this moment will be returned. Only works with &#39;between&#39; filter.

Name : latest
Description : A point in time. No results after this moment will be returned. Only works with &#39;between&#39; filter.


### Response Fields

Name : paging
Description : Hash containing relevant paging parameters.

Name : limit
Description : Maximum number of slots returned.

Name : mode
Description : Types of slots which were requested.

Name : moment
Description : Point-in-time which was used for the query.

Name : filter
Description : Type of filter which was applied to initial data.

Name : earliest
Description : If set, no Slots which have ended before this point-in-time will be included in the result.

Name : latest
Description : If set, no Slots which are starting after this point-in-time will be included in the result.

Name : before
Description : Cursor that represents the first item in the response dataset.

Name : after
Description : Cursor that represents the last item in the response dataset.

Name : data
Description : Array containing the result dataset.

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
Authorization: Token token=I5YuWKOBMWwESdm1cycnbenjSGg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/friendslots</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/friendslots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=I5YuWKOBMWwESdm1cycnbenjSGg&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;66ce3f94164053359d22c68e3f33eeba&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1c2bfefa-e345-478b-badf-346dda4aa9bb
X-Runtime: 0.040771
Content-Length: 2387</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 10,
    "title" : "Slot title 126",
    "description" : "",
    "startDate" : "2019-09-19T06:44:02.000Z",
    "createdAt" : "2016-08-30T09:50:53.637Z",
    "updatedAt" : "2016-08-30T09:50:53.637Z",
    "deletedAt" : null,
    "endDate" : "2019-10-19T06:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 26,
      "username" : "User 564",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-08-30T09:50:53.629Z",
      "updatedAt" : "2016-08-30T09:50:53.629Z",
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
    "id" : 11,
    "title" : "Slot title 127",
    "description" : "",
    "startDate" : "2019-09-20T07:44:02.000Z",
    "createdAt" : "2016-08-30T09:50:53.661Z",
    "updatedAt" : "2016-08-30T09:50:53.661Z",
    "deletedAt" : null,
    "endDate" : "2019-10-20T07:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 29,
      "username" : "User 567",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-08-30T09:50:53.653Z",
      "updatedAt" : "2016-08-30T09:50:53.653Z",
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
  },
  {
    "id" : 13,
    "title" : "Slot title 129",
    "description" : "",
    "startDate" : "2019-09-22T09:44:02.000Z",
    "createdAt" : "2016-08-30T09:50:53.705Z",
    "updatedAt" : "2016-08-30T09:50:53.705Z",
    "deletedAt" : null,
    "endDate" : "2019-10-22T09:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 31,
      "username" : "User 570",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-08-30T09:50:53.671Z",
      "updatedAt" : "2016-08-30T09:50:53.671Z",
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
    "id" : 14,
    "title" : "Slot title 130",
    "description" : "",
    "startDate" : "2019-09-23T10:44:02.000Z",
    "createdAt" : "2016-08-30T09:50:53.716Z",
    "updatedAt" : "2016-08-30T09:50:53.716Z",
    "deletedAt" : null,
    "endDate" : "2019-10-23T10:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 31,
      "username" : "User 570",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-08-30T09:50:53.671Z",
      "updatedAt" : "2016-08-30T09:50:53.671Z",
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
