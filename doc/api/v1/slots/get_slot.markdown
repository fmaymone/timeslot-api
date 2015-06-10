# Slots API

## Get slot

### GET /v1/slots/:id

if a user is authenticated the slot settings (alerts) will be included

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the slot to get


### Response Fields

Name : id
Description : ID of the slot

Name : title
Description : Title of the slot

Name : startDate
Description : Startdate of the slot

Name : endDate
Description : Enddate of the slot

Name : createdAt
Description : Creation of slot

Name : updatedAt
Description : Last update of slot

Name : deletedAt
Description : Delete date of slot or nil

Name : location
Description : Location data for the slot

Name : creator
Description : User who created the slot

Name : settings
Description : Only included if it&#39;s a slot of the current User (created-/friend-/re-/groupslot),

contains User specific settings for this slot (alerts)

Name : visibility
Description : Visibiltiy of the slot

Name : notes
Description : Notes on the slot

Name : likes
Description : Likes for the slot

Name : commentsCounter
Description : Number of comments on the slot

Name : shareUrl
Description : Share URL for this slot, nil if not yet shared

Name : images
Description : Images for the slot

Name : voices
Description : Voice recordings for the slot

Name : videos
Description : Videos recordings for the slot

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=Hv0y9oyCHXX_95rPfYMrnA5DcMk
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/25</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/25&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=Hv0y9oyCHXX_95rPfYMrnA5DcMk&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;14b52d05a941d6e529d2c9ed21997a3e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e18c4bd9-85b1-40cd-87e6-be45a7f2a209
X-Runtime: 0.040923
Content-Length: 1388</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 25,
  "title" : "Slot title 27",
  "startDate" : "2019-09-01T03:44:02.000Z",
  "createdAt" : "2015-06-10T11:53:24.091Z",
  "updatedAt" : "2015-06-10T11:53:24.091Z",
  "deletedAt" : null,
  "endDate" : "2019-10-01T03:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 173,
    "username" : "User 170",
    "createdAt" : "2015-06-10T11:53:24.079Z",
    "updatedAt" : "2015-06-10T11:53:24.079Z",
    "deletedAt" : null,
    "image" : null
  },
  "notes" : [],
  "photos" : [
    {
      "mediaId" : 21,
      "clyid" : "dfhjghjkdisudgfds7iy18",
      "position" : 0,
      "localId" : null
    },
    {
      "mediaId" : 22,
      "clyid" : "dfhjghjkdisudgfds7iy19",
      "position" : 1,
      "localId" : null
    },
    {
      "mediaId" : 23,
      "clyid" : "dfhjghjkdisudgfds7iy20",
      "position" : 2,
      "localId" : null
    },
    {
      "mediaId" : 24,
      "clyid" : "dfhjghjkdisudgfds7iy21",
      "position" : 3,
      "localId" : null
    },
    {
      "mediaId" : 25,
      "clyid" : "dfhjghjkdisudgfds7iy22",
      "position" : 4,
      "localId" : null
    },
    {
      "mediaId" : 26,
      "clyid" : "dfhjghjkdisudgfds7iy23",
      "position" : 5,
      "localId" : null
    }
  ],
  "voices" : [
    {
      "mediaId" : 27,
      "clyid" : "dfhjghjkdisudgfds7iy24",
      "position" : 6,
      "localId" : null,
      "duration=" : null
    },
    {
      "mediaId" : 28,
      "clyid" : "dfhjghjkdisudgfds7iy25",
      "position" : 7,
      "localId" : null,
      "duration=" : null
    }
  ],
  "videos" : [
    {
      "mediaId" : 29,
      "clyid" : "dfhjghjkdisudgfds7iy26",
      "position" : 8,
      "localId" : null,
      "duration=" : null,
      "thumbnail=" : null
    },
    {
      "mediaId" : 30,
      "clyid" : "dfhjghjkdisudgfds7iy27",
      "position" : 9,
      "localId" : null,
      "duration=" : null,
      "thumbnail=" : null
    }
  ],
  "settings" : {
    "alerts" : "1110001100"
  },
  "visibility" : "public",
  "likes" : 3,
  "commentsCounter" : 0,
  "shareUrl" : "abcd1234"
}
```
