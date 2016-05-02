# Groups API

## Get slots in a slotgroup by UUID

### GET /v1/groups/:group_uuid/slots

endpoint supports slot pagination

returns 200 and a list of slots

returns 404 if UUID is invalid

### Parameters

Name : group_uuid *- required -*
Description : ID of the group to get slots for

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
Default is **upcoming**.

Name : before
Description : Pagination cursor to retrieve slots which do happen BEFORE the slot represented by this cursor. If a cursor is send, **mode** and **moment** are ignored.

Name : after
Description : Pagination cursor to retrieve slots which do happen AFTER the slot represented by this cursor. If a cursor is send, **mode** and **moment** are ignored.

Name : earliest
Description : A point in time. No results before this moment will be returned. Only works with &#39;between&#39; filter.

Name : latest
Description : A point in time. No results after this moment will be returned. Only works with &#39;between&#39; filter.


### Response Fields

Name : groupId
Description : deprecated: ID of the group

Name : groupUuid
Description : UUID of the group

Name : slotCount
Description : Number of all slot in this group

Name : upcomingCount
Description : Number of upcoming group slots

Name : slots
Description : Array of group slots

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

Name : alerts
Description : Alerts for the slot for the current user

Name : media
Description : Media items of the slot

Name : url
Description : direct url to fetch the slot

Name : createdAt
Description : Creation datetime of the slot

Name : updatedAt
Description : Last update of the slot

Name : deletedAt
Description : Deletion datetime of the slot

Name : paging
Description : Hash containing relevant paging parameters.

Name : limit
Description : Maximum number of slots returned.

Name : mode
Description : Types of slots which were requested.

Name : filter
Description : Type of filter which was applied to initial data.

Name : moment
Description : Point-in-time which was used for the query.

Name : before
Description : Cursor that represents the first item in the response dataset.

Name : after
Description : Cursor that represents the last item in the response dataset.

Name : data
Description : Array containing the result dataset.

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=CuVzrF0WHnoAEuAyHIusKV10vq4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/a6dca885-5cc7-4c38-b70e-f5f92ced1955/slots</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/a6dca885-5cc7-4c38-b70e-f5f92ced1955/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=CuVzrF0WHnoAEuAyHIusKV10vq4&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;859f00c9127da5e2794817834413c305&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ae1b08b5-ced2-4556-86f6-a27fe181a43e
X-Runtime: 0.048560
Content-Length: 1963</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : "a6dca885-5cc7-4c38-b70e-f5f92ced1955",
  "slotCount" : 4,
  "upcomingCount" : 4,
  "slots" : [
    {
      "id" : 108,
      "title" : "Slot title 82",
      "startDate" : "2019-09-05T13:44:02.000Z",
      "createdAt" : "2016-05-01T22:54:08.633Z",
      "updatedAt" : "2016-05-01T22:54:08.633Z",
      "deletedAt" : null,
      "endDate" : "2019-10-05T13:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 119,
        "username" : "User 234",
        "createdAt" : "2016-05-01T22:54:08.629Z",
        "updatedAt" : "2016-05-01T22:54:08.629Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "likerIds" : [],
      "likes" : 0,
      "commentsCounter" : 0
    },
    {
      "id" : 109,
      "title" : "Slot title 83",
      "startDate" : "2019-09-06T14:44:02.000Z",
      "createdAt" : "2016-05-01T22:54:08.641Z",
      "updatedAt" : "2016-05-01T22:54:08.641Z",
      "deletedAt" : null,
      "endDate" : "2019-10-06T14:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 120,
        "username" : "User 235",
        "createdAt" : "2016-05-01T22:54:08.636Z",
        "updatedAt" : "2016-05-01T22:54:08.636Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "likerIds" : [],
      "likes" : 0,
      "commentsCounter" : 0
    },
    {
      "id" : 110,
      "title" : "Slot title 84",
      "startDate" : "2019-09-07T15:44:02.000Z",
      "createdAt" : "2016-05-01T22:54:08.650Z",
      "updatedAt" : "2016-05-01T22:54:08.650Z",
      "deletedAt" : null,
      "endDate" : "2019-10-07T15:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 121,
        "username" : "User 236",
        "createdAt" : "2016-05-01T22:54:08.645Z",
        "updatedAt" : "2016-05-01T22:54:08.645Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "likerIds" : [],
      "likes" : 0,
      "commentsCounter" : 0
    },
    {
      "id" : 111,
      "title" : "Slot title 85",
      "startDate" : "2019-09-08T16:44:02.000Z",
      "createdAt" : "2016-05-01T22:54:08.658Z",
      "updatedAt" : "2016-05-01T22:54:08.658Z",
      "deletedAt" : null,
      "endDate" : "2019-10-08T16:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 122,
        "username" : "User 237",
        "createdAt" : "2016-05-01T22:54:08.654Z",
        "updatedAt" : "2016-05-01T22:54:08.654Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "likerIds" : [],
      "likes" : 0,
      "commentsCounter" : 0
    }
  ]
}
```
