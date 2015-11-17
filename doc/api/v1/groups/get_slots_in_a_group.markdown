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
Authorization: Token token=RhJ_ZHzGoo3yxq1YfOu1kLxbmVE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/13/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/13/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=RhJ_ZHzGoo3yxq1YfOu1kLxbmVE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;5791aa9e7a4e0c6e40de5478f0768b8a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: cd33fe3e-c563-4e67-b632-c53988da211e
X-Runtime: 0.085664
Vary: Origin
Content-Length: 2155</pre>

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
      "id" : 7,
      "title" : "Slot title 24",
      "startDate" : "2019-09-01T03:44:02.000Z",
      "createdAt" : "2015-11-17T23:46:11.037Z",
      "updatedAt" : "2015-11-17T23:46:11.037Z",
      "deletedAt" : null,
      "endDate" : "2019-10-01T03:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 38,
        "username" : "User 93",
        "createdAt" : "2015-11-17T23:46:11.032Z",
        "updatedAt" : "2015-11-17T23:46:11.032Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "0000000000"
      },
      "group" : {
        "id" : 13
      },
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/7"
    },
    {
      "id" : 6,
      "title" : "Slot title 23",
      "startDate" : "2019-09-27T02:44:02.000Z",
      "createdAt" : "2015-11-17T23:46:11.029Z",
      "updatedAt" : "2015-11-17T23:46:11.029Z",
      "deletedAt" : null,
      "endDate" : "2019-10-27T02:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 37,
        "username" : "User 92",
        "createdAt" : "2015-11-17T23:46:11.025Z",
        "updatedAt" : "2015-11-17T23:46:11.025Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "0000000000"
      },
      "group" : {
        "id" : 13
      },
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/6"
    },
    {
      "id" : 5,
      "title" : "Slot title 22",
      "startDate" : "2019-09-26T01:44:02.000Z",
      "createdAt" : "2015-11-17T23:46:11.023Z",
      "updatedAt" : "2015-11-17T23:46:11.023Z",
      "deletedAt" : null,
      "endDate" : "2019-10-26T01:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 36,
        "username" : "User 91",
        "createdAt" : "2015-11-17T23:46:11.019Z",
        "updatedAt" : "2015-11-17T23:46:11.019Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "0000000000"
      },
      "group" : {
        "id" : 13
      },
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/5"
    },
    {
      "id" : 4,
      "title" : "Slot title 21",
      "startDate" : "2019-09-25T00:44:02.000Z",
      "createdAt" : "2015-11-17T23:46:11.016Z",
      "updatedAt" : "2015-11-17T23:46:11.016Z",
      "deletedAt" : null,
      "endDate" : "2019-10-25T00:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 35,
        "username" : "User 90",
        "createdAt" : "2015-11-17T23:46:11.012Z",
        "updatedAt" : "2015-11-17T23:46:11.012Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "0000000000"
      },
      "group" : {
        "id" : 13
      },
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/4"
    }
  ]
}
```
