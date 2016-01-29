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
Authorization: Token token=-OuicBtJV3_nKo3F-8U4Xig1I-o
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/de479a79-e505-4c3f-bc38-a4463ef869a3/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/de479a79-e505-4c3f-bc38-a4463ef869a3/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=-OuicBtJV3_nKo3F-8U4Xig1I-o&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;99f9d9a3ea155b7ac1be1cdfb482db8f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d36d081d-b966-427c-9234-e3e5dce8e286
X-Runtime: 0.162745
Vary: Origin
Content-Length: 1971</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : "de479a79-e505-4c3f-bc38-a4463ef869a3",
  "slotCount" : 4,
  "upcomingCount" : 4,
  "slots" : [
    {
      "id" : 1,
      "title" : "Slot title 28",
      "startDate" : "2019-09-05T07:44:02.000Z",
      "createdAt" : "2016-01-29T19:38:56.031Z",
      "updatedAt" : "2016-01-29T19:38:56.031Z",
      "deletedAt" : null,
      "endDate" : "2019-10-05T07:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 25,
        "username" : "User 103",
        "createdAt" : "2016-01-29T19:38:56.007Z",
        "updatedAt" : "2016-01-29T19:38:56.007Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "reslotsCounter" : 0,
      "likes" : 0,
      "commentsCounter" : 0
    },
    {
      "id" : 2,
      "title" : "Slot title 29",
      "startDate" : "2019-09-06T08:44:02.000Z",
      "createdAt" : "2016-01-29T19:38:56.119Z",
      "updatedAt" : "2016-01-29T19:38:56.119Z",
      "deletedAt" : null,
      "endDate" : "2019-10-06T08:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 26,
        "username" : "User 104",
        "createdAt" : "2016-01-29T19:38:56.097Z",
        "updatedAt" : "2016-01-29T19:38:56.097Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "reslotsCounter" : 0,
      "likes" : 0,
      "commentsCounter" : 0
    },
    {
      "id" : 3,
      "title" : "Slot title 30",
      "startDate" : "2019-09-07T09:44:02.000Z",
      "createdAt" : "2016-01-29T19:38:56.157Z",
      "updatedAt" : "2016-01-29T19:38:56.157Z",
      "deletedAt" : null,
      "endDate" : "2019-10-07T09:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 27,
        "username" : "User 105",
        "createdAt" : "2016-01-29T19:38:56.135Z",
        "updatedAt" : "2016-01-29T19:38:56.135Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "reslotsCounter" : 0,
      "likes" : 0,
      "commentsCounter" : 0
    },
    {
      "id" : 4,
      "title" : "Slot title 31",
      "startDate" : "2019-09-08T10:44:02.000Z",
      "createdAt" : "2016-01-29T19:38:56.208Z",
      "updatedAt" : "2016-01-29T19:38:56.208Z",
      "deletedAt" : null,
      "endDate" : "2019-10-08T10:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 28,
        "username" : "User 106",
        "createdAt" : "2016-01-29T19:38:56.176Z",
        "updatedAt" : "2016-01-29T19:38:56.176Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "reslotsCounter" : 0,
      "likes" : 0,
      "commentsCounter" : 0
    }
  ]
}
```
