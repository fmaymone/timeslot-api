# Groups API

## Get slots in a group

### GET /v1/groups/:group_id/slots

returns 200 and a list of all slots

returns 404 if ID is invalid

### Parameters

Name : group_id *- required -*
Description : ID of the group to get slots for


### Response Fields

Name : groupId
Description : ID of the group

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

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=ZNSYOSauaNZSwvXLswBHpjKKCGM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/13/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/13/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=ZNSYOSauaNZSwvXLswBHpjKKCGM&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;754dd35e27198025f9824ddebf0a15be&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 0246d803-7fe5-4b30-b843-73b7cc1d1440
X-Runtime: 0.032339
Vary: Origin
Content-Length: 1991</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 13,
  "slotCount" : 4,
  "upcomingCount" : 4,
  "slots" : [
    {
      "id" : 1,
      "title" : "Slot title 22",
      "startDate" : "2019-09-26T01:44:02.000Z",
      "createdAt" : "2015-12-23T11:18:30.737Z",
      "updatedAt" : "2015-12-23T11:18:30.737Z",
      "deletedAt" : null,
      "endDate" : "2019-10-26T01:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 25,
        "username" : "User 91",
        "createdAt" : "2015-12-23T11:18:30.729Z",
        "updatedAt" : "2015-12-23T11:18:30.729Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "group" : {
        "id" : 13
      },
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null
    },
    {
      "id" : 2,
      "title" : "Slot title 23",
      "startDate" : "2019-09-27T02:44:02.000Z",
      "createdAt" : "2015-12-23T11:18:30.744Z",
      "updatedAt" : "2015-12-23T11:18:30.744Z",
      "deletedAt" : null,
      "endDate" : "2019-10-27T02:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 26,
        "username" : "User 92",
        "createdAt" : "2015-12-23T11:18:30.740Z",
        "updatedAt" : "2015-12-23T11:18:30.740Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "group" : {
        "id" : 13
      },
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null
    },
    {
      "id" : 3,
      "title" : "Slot title 24",
      "startDate" : "2019-09-01T03:44:02.000Z",
      "createdAt" : "2015-12-23T11:18:30.751Z",
      "updatedAt" : "2015-12-23T11:18:30.751Z",
      "deletedAt" : null,
      "endDate" : "2019-10-01T03:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 27,
        "username" : "User 93",
        "createdAt" : "2015-12-23T11:18:30.746Z",
        "updatedAt" : "2015-12-23T11:18:30.746Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "group" : {
        "id" : 13
      },
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null
    },
    {
      "id" : 4,
      "title" : "Slot title 25",
      "startDate" : "2019-09-02T04:44:02.000Z",
      "createdAt" : "2015-12-23T11:18:30.760Z",
      "updatedAt" : "2015-12-23T11:18:30.760Z",
      "deletedAt" : null,
      "endDate" : "2019-10-02T04:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 28,
        "username" : "User 94",
        "createdAt" : "2015-12-23T11:18:30.754Z",
        "updatedAt" : "2015-12-23T11:18:30.754Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "group" : {
        "id" : 13
      },
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null
    }
  ]
}
```
