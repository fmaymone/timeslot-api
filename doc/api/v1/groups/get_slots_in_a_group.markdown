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

Name : alerts
Description : Alerts for the slot for the current user

Name : photos
Description : Photos for the slot

Name : voices
Description : Voice recordings for the slot

Name : videos
Description : Videos for the slot

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
Authorization: Token token=sfZp8yl8d93WLyVK4CmHRX_cpXg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/18/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/18/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=sfZp8yl8d93WLyVK4CmHRX_cpXg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;04c02ee1ed226cf8682592310ffb7f05&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6a7cb007-8c54-4f1d-9fe9-50cad0b56b9d
X-Runtime: 0.141131
Content-Length: 2371</pre>

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
      "createdAt" : "2015-06-11T16:20:50.136Z",
      "updatedAt" : "2015-06-11T16:20:50.136Z",
      "deletedAt" : null,
      "endDate" : "2019-10-22T21:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 78,
        "username" : "User 75",
        "createdAt" : "2015-06-11T16:20:50.131Z",
        "updatedAt" : "2015-06-11T16:20:50.131Z",
        "deletedAt" : null,
        "image" : {
          "clyid" : null,
          "localId" : null
        }
      },
      "notes" : [],
      "photos" : [],
      "voices" : [],
      "videos" : [],
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
      "createdAt" : "2015-06-11T16:20:50.143Z",
      "updatedAt" : "2015-06-11T16:20:50.143Z",
      "deletedAt" : null,
      "endDate" : "2019-10-23T22:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 79,
        "username" : "User 76",
        "createdAt" : "2015-06-11T16:20:50.139Z",
        "updatedAt" : "2015-06-11T16:20:50.139Z",
        "deletedAt" : null,
        "image" : {
          "clyid" : null,
          "localId" : null
        }
      },
      "notes" : [],
      "photos" : [],
      "voices" : [],
      "videos" : [],
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
      "createdAt" : "2015-06-11T16:20:50.150Z",
      "updatedAt" : "2015-06-11T16:20:50.150Z",
      "deletedAt" : null,
      "endDate" : "2019-10-24T23:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 80,
        "username" : "User 77",
        "createdAt" : "2015-06-11T16:20:50.145Z",
        "updatedAt" : "2015-06-11T16:20:50.145Z",
        "deletedAt" : null,
        "image" : {
          "clyid" : null,
          "localId" : null
        }
      },
      "notes" : [],
      "photos" : [],
      "voices" : [],
      "videos" : [],
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
      "createdAt" : "2015-06-11T16:20:50.158Z",
      "updatedAt" : "2015-06-11T16:20:50.158Z",
      "deletedAt" : null,
      "endDate" : "2019-10-25T00:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 81,
        "username" : "User 78",
        "createdAt" : "2015-06-11T16:20:50.153Z",
        "updatedAt" : "2015-06-11T16:20:50.153Z",
        "deletedAt" : null,
        "image" : {
          "clyid" : null,
          "localId" : null
        }
      },
      "notes" : [],
      "photos" : [],
      "voices" : [],
      "videos" : [],
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
