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

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=3eu3-3Ef4-cOqHjmJm5LilBc8XE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/91e9ed66-fb5f-4fe9-b8c2-8cd12b519e16/slots</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/91e9ed66-fb5f-4fe9-b8c2-8cd12b519e16/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=3eu3-3Ef4-cOqHjmJm5LilBc8XE&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;452cb90cdb94c5c346ff9c82aa89eeb3&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 680f35e5-b818-482c-8a14-efd365d777cf
X-Runtime: 0.073645
Content-Length: 4627</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : "91e9ed66-fb5f-4fe9-b8c2-8cd12b519e16",
  "slotCount" : 4,
  "upcomingCount" : 4,
  "slots" : [
    {
      "id" : 119,
      "title" : "Slot title 91",
      "description" : "",
      "startDate" : "2019-09-11T19:44:02.000Z",
      "createdAt" : "2016-08-30T09:50:50.784Z",
      "updatedAt" : "2016-08-30T09:50:50.784Z",
      "deletedAt" : null,
      "endDate" : "2019-10-11T19:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 326,
        "username" : "User 436",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-08-30T09:50:50.776Z",
        "updatedAt" : "2016-08-30T09:50:50.776Z",
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
      "commentsCounter" : 0,
      "firstGroup" : {
        "id" : "91e9ed66-fb5f-4fe9-b8c2-8cd12b519e16",
        "name" : "Testgroup 132",
        "image" : "",
        "description" : null,
        "defaultColor" : "000000",
        "membersCanPost" : false,
        "membersCanInvite" : false,
        "public" : false,
        "createdAt" : "2016-08-30T09:50:50.769Z",
        "updatedAt" : "2016-08-30T09:50:50.769Z",
        "deletedAt" : null,
        "owner" : {
          "id" : 325,
          "username" : "User 435",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-08-30T09:50:50.766Z",
          "updatedAt" : "2016-08-30T09:50:50.766Z",
          "deletedAt" : null,
          "image" : ""
        },
        "memberIds" : [
          325
        ],
        "memberCount" : 1,
        "slotCount" : 4
      },
      "slotGroupUuids" : [
        "91e9ed66-fb5f-4fe9-b8c2-8cd12b519e16"
      ]
    },
    {
      "id" : 120,
      "title" : "Slot title 92",
      "description" : "",
      "startDate" : "2019-09-12T20:44:02.000Z",
      "createdAt" : "2016-08-30T09:50:50.800Z",
      "updatedAt" : "2016-08-30T09:50:50.800Z",
      "deletedAt" : null,
      "endDate" : "2019-10-12T20:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 327,
        "username" : "User 437",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-08-30T09:50:50.794Z",
        "updatedAt" : "2016-08-30T09:50:50.794Z",
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
      "commentsCounter" : 0,
      "firstGroup" : {
        "id" : "91e9ed66-fb5f-4fe9-b8c2-8cd12b519e16",
        "name" : "Testgroup 132",
        "image" : "",
        "description" : null,
        "defaultColor" : "000000",
        "membersCanPost" : false,
        "membersCanInvite" : false,
        "public" : false,
        "createdAt" : "2016-08-30T09:50:50.769Z",
        "updatedAt" : "2016-08-30T09:50:50.769Z",
        "deletedAt" : null,
        "owner" : {
          "id" : 325,
          "username" : "User 435",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-08-30T09:50:50.766Z",
          "updatedAt" : "2016-08-30T09:50:50.766Z",
          "deletedAt" : null,
          "image" : ""
        },
        "memberIds" : [
          325
        ],
        "memberCount" : 1,
        "slotCount" : 4
      },
      "slotGroupUuids" : [
        "91e9ed66-fb5f-4fe9-b8c2-8cd12b519e16"
      ]
    },
    {
      "id" : 121,
      "title" : "Slot title 93",
      "description" : "",
      "startDate" : "2019-09-13T21:44:02.000Z",
      "createdAt" : "2016-08-30T09:50:50.809Z",
      "updatedAt" : "2016-08-30T09:50:50.809Z",
      "deletedAt" : null,
      "endDate" : "2019-10-13T21:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 328,
        "username" : "User 438",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-08-30T09:50:50.803Z",
        "updatedAt" : "2016-08-30T09:50:50.803Z",
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
      "commentsCounter" : 0,
      "firstGroup" : {
        "id" : "91e9ed66-fb5f-4fe9-b8c2-8cd12b519e16",
        "name" : "Testgroup 132",
        "image" : "",
        "description" : null,
        "defaultColor" : "000000",
        "membersCanPost" : false,
        "membersCanInvite" : false,
        "public" : false,
        "createdAt" : "2016-08-30T09:50:50.769Z",
        "updatedAt" : "2016-08-30T09:50:50.769Z",
        "deletedAt" : null,
        "owner" : {
          "id" : 325,
          "username" : "User 435",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-08-30T09:50:50.766Z",
          "updatedAt" : "2016-08-30T09:50:50.766Z",
          "deletedAt" : null,
          "image" : ""
        },
        "memberIds" : [
          325
        ],
        "memberCount" : 1,
        "slotCount" : 4
      },
      "slotGroupUuids" : [
        "91e9ed66-fb5f-4fe9-b8c2-8cd12b519e16"
      ]
    },
    {
      "id" : 122,
      "title" : "Slot title 94",
      "description" : "",
      "startDate" : "2019-09-14T22:44:02.000Z",
      "createdAt" : "2016-08-30T09:50:50.818Z",
      "updatedAt" : "2016-08-30T09:50:50.818Z",
      "deletedAt" : null,
      "endDate" : "2019-10-14T22:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 329,
        "username" : "User 439",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-08-30T09:50:50.812Z",
        "updatedAt" : "2016-08-30T09:50:50.812Z",
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
      "commentsCounter" : 0,
      "firstGroup" : {
        "id" : "91e9ed66-fb5f-4fe9-b8c2-8cd12b519e16",
        "name" : "Testgroup 132",
        "image" : "",
        "description" : null,
        "defaultColor" : "000000",
        "membersCanPost" : false,
        "membersCanInvite" : false,
        "public" : false,
        "createdAt" : "2016-08-30T09:50:50.769Z",
        "updatedAt" : "2016-08-30T09:50:50.769Z",
        "deletedAt" : null,
        "owner" : {
          "id" : 325,
          "username" : "User 435",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-08-30T09:50:50.766Z",
          "updatedAt" : "2016-08-30T09:50:50.766Z",
          "deletedAt" : null,
          "image" : ""
        },
        "memberIds" : [
          325
        ],
        "memberCount" : 1,
        "slotCount" : 4
      },
      "slotGroupUuids" : [
        "91e9ed66-fb5f-4fe9-b8c2-8cd12b519e16"
      ]
    }
  ]
}
```
