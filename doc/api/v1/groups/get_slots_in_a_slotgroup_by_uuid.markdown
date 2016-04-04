# Groups API

## Get slots in a slotgroup by UUID

### GET /v1/groups/:group_uuid/slots

returns 200 and a list of all slots

returns 404 if UUID is invalid

### Parameters

Name : group_uuid *- required -*
Description : ID of the group to get slots for


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

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=n4eVTdZGi3mkMZjPK3dpjIXN6dw
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/3d156c85-8e1c-4d71-8abe-d247ec999eac/slots</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/3d156c85-8e1c-4d71-8abe-d247ec999eac/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=n4eVTdZGi3mkMZjPK3dpjIXN6dw&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;d89ea84b0e25c6bb6b312406a9207f95&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a3c38691-b3b0-4178-aa91-71a4684fe916
X-Runtime: 0.036224
Vary: Origin
Content-Length: 1891</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : "3d156c85-8e1c-4d71-8abe-d247ec999eac",
  "slotCount" : 4,
  "upcomingCount" : 4,
  "slots" : [
    {
      "id" : 4,
      "title" : "Slot title 22",
      "startDate" : "2019-09-26T01:44:02.000Z",
      "createdAt" : "2016-04-04T20:50:22.247Z",
      "updatedAt" : "2016-04-04T20:50:22.247Z",
      "deletedAt" : null,
      "endDate" : "2019-10-26T01:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 27,
        "username" : "User 88",
        "createdAt" : "2016-04-04T20:50:22.241Z",
        "updatedAt" : "2016-04-04T20:50:22.241Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "likes" : 0,
      "commentsCounter" : 0
    },
    {
      "id" : 5,
      "title" : "Slot title 23",
      "startDate" : "2019-09-27T02:44:02.000Z",
      "createdAt" : "2016-04-04T20:50:22.257Z",
      "updatedAt" : "2016-04-04T20:50:22.257Z",
      "deletedAt" : null,
      "endDate" : "2019-10-27T02:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 28,
        "username" : "User 89",
        "createdAt" : "2016-04-04T20:50:22.252Z",
        "updatedAt" : "2016-04-04T20:50:22.252Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "likes" : 0,
      "commentsCounter" : 0
    },
    {
      "id" : 6,
      "title" : "Slot title 24",
      "startDate" : "2019-09-01T03:44:02.000Z",
      "createdAt" : "2016-04-04T20:50:22.267Z",
      "updatedAt" : "2016-04-04T20:50:22.267Z",
      "deletedAt" : null,
      "endDate" : "2019-10-01T03:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 29,
        "username" : "User 90",
        "createdAt" : "2016-04-04T20:50:22.261Z",
        "updatedAt" : "2016-04-04T20:50:22.261Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "likes" : 0,
      "commentsCounter" : 0
    },
    {
      "id" : 7,
      "title" : "Slot title 25",
      "startDate" : "2019-09-02T04:44:02.000Z",
      "createdAt" : "2016-04-04T20:50:22.275Z",
      "updatedAt" : "2016-04-04T20:50:22.275Z",
      "deletedAt" : null,
      "endDate" : "2019-10-02T04:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 30,
        "username" : "User 91",
        "createdAt" : "2016-04-04T20:50:22.271Z",
        "updatedAt" : "2016-04-04T20:50:22.271Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "likes" : 0,
      "commentsCounter" : 0
    }
  ]
}
```
