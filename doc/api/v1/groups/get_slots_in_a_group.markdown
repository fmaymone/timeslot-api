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
Authorization: Token token=jvNFLgeDfgCW-eiMkb2rhx_llJY
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/13/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/13/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=jvNFLgeDfgCW-eiMkb2rhx_llJY&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;65d8afa7d81952cdb346078b06047103&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 18f2fefa-36f2-469e-8e6c-2c272d2b998d
X-Runtime: 0.087929
Vary: Origin
Content-Length: 2275</pre>

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
      "id" : 4,
      "title" : "Slot title 20",
      "startDate" : "2019-09-24T23:44:02.000Z",
      "createdAt" : "2015-10-30T15:01:02.141Z",
      "updatedAt" : "2015-10-30T15:01:02.141Z",
      "deletedAt" : null,
      "endDate" : "2019-10-24T23:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 35,
        "username" : "User 88",
        "createdAt" : "2015-10-30T15:01:02.137Z",
        "updatedAt" : "2015-10-30T15:01:02.137Z",
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
        "id" : 13
      },
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/4"
    },
    {
      "id" : 5,
      "title" : "Slot title 21",
      "startDate" : "2019-09-25T00:44:02.000Z",
      "createdAt" : "2015-10-30T15:01:02.149Z",
      "updatedAt" : "2015-10-30T15:01:02.149Z",
      "deletedAt" : null,
      "endDate" : "2019-10-25T00:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 36,
        "username" : "User 89",
        "createdAt" : "2015-10-30T15:01:02.144Z",
        "updatedAt" : "2015-10-30T15:01:02.144Z",
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
        "id" : 13
      },
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/5"
    },
    {
      "id" : 6,
      "title" : "Slot title 22",
      "startDate" : "2019-09-26T01:44:02.000Z",
      "createdAt" : "2015-10-30T15:01:02.156Z",
      "updatedAt" : "2015-10-30T15:01:02.156Z",
      "deletedAt" : null,
      "endDate" : "2019-10-26T01:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 37,
        "username" : "User 90",
        "createdAt" : "2015-10-30T15:01:02.151Z",
        "updatedAt" : "2015-10-30T15:01:02.151Z",
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
        "id" : 13
      },
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/6"
    },
    {
      "id" : 7,
      "title" : "Slot title 23",
      "startDate" : "2019-09-27T02:44:02.000Z",
      "createdAt" : "2015-10-30T15:01:02.166Z",
      "updatedAt" : "2015-10-30T15:01:02.166Z",
      "deletedAt" : null,
      "endDate" : "2019-10-27T02:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 38,
        "username" : "User 91",
        "createdAt" : "2015-10-30T15:01:02.159Z",
        "updatedAt" : "2015-10-30T15:01:02.159Z",
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
        "id" : 13
      },
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/7"
    }
  ]
}
```
