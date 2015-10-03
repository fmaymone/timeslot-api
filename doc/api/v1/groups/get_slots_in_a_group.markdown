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
Authorization: Token token=E4Ee8oHkFWYvThX_PNVrcOB3Lvg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/18/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/18/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=E4Ee8oHkFWYvThX_PNVrcOB3Lvg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;9a852d1beaceef9a251944cbb01dc0c4&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d3485b8e-3255-442a-be63-9edfd9e17ecd
X-Runtime: 0.088469
Vary: Origin
Content-Length: 2287</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 18,
  "slotCount" : 4,
  "upcomingCount" : 4,
  "slots" : [
    {
      "id" : 19,
      "title" : "Slot title 21",
      "startDate" : "2019-09-22T21:44:02.000Z",
      "createdAt" : "2015-10-03T22:30:40.339Z",
      "updatedAt" : "2015-10-03T22:30:40.339Z",
      "deletedAt" : null,
      "endDate" : "2019-10-22T21:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 107,
        "username" : "User 83",
        "createdAt" : "2015-10-03T22:30:40.330Z",
        "updatedAt" : "2015-10-03T22:30:40.330Z",
        "deletedAt" : null,
        "image" : {
          "publicId" : null,
          "localId" : null
        }
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "0000000000"
      },
      "group" : {
        "id" : 18
      },
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/19"
    },
    {
      "id" : 20,
      "title" : "Slot title 22",
      "startDate" : "2019-09-23T22:44:02.000Z",
      "createdAt" : "2015-10-03T22:30:40.345Z",
      "updatedAt" : "2015-10-03T22:30:40.345Z",
      "deletedAt" : null,
      "endDate" : "2019-10-23T22:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 108,
        "username" : "User 84",
        "createdAt" : "2015-10-03T22:30:40.341Z",
        "updatedAt" : "2015-10-03T22:30:40.341Z",
        "deletedAt" : null,
        "image" : {
          "publicId" : null,
          "localId" : null
        }
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "0000000000"
      },
      "group" : {
        "id" : 18
      },
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/20"
    },
    {
      "id" : 21,
      "title" : "Slot title 23",
      "startDate" : "2019-09-24T23:44:02.000Z",
      "createdAt" : "2015-10-03T22:30:40.353Z",
      "updatedAt" : "2015-10-03T22:30:40.353Z",
      "deletedAt" : null,
      "endDate" : "2019-10-24T23:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 109,
        "username" : "User 85",
        "createdAt" : "2015-10-03T22:30:40.348Z",
        "updatedAt" : "2015-10-03T22:30:40.348Z",
        "deletedAt" : null,
        "image" : {
          "publicId" : null,
          "localId" : null
        }
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "0000000000"
      },
      "group" : {
        "id" : 18
      },
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/21"
    },
    {
      "id" : 22,
      "title" : "Slot title 24",
      "startDate" : "2019-09-25T00:44:02.000Z",
      "createdAt" : "2015-10-03T22:30:40.361Z",
      "updatedAt" : "2015-10-03T22:30:40.361Z",
      "deletedAt" : null,
      "endDate" : "2019-10-25T00:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 110,
        "username" : "User 86",
        "createdAt" : "2015-10-03T22:30:40.356Z",
        "updatedAt" : "2015-10-03T22:30:40.356Z",
        "deletedAt" : null,
        "image" : {
          "publicId" : null,
          "localId" : null
        }
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "0000000000"
      },
      "group" : {
        "id" : 18
      },
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/22"
    }
  ]
}
```
