# Slots API

## Get Reslot

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

Name : openEnd
Description : OpenEnd Boolean Flag

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
Description : Visibiltiy of the slot (private/friend/foaf/public)

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

Name : audios
Description : Audio recordings for the slot

Name : videos
Description : Videos recordings for the slot

Name : reslotsCounter
Description : Number of reslots for this slot

Name : slotter
Description : contains ID of the User who did reslot

Name : parent
Description : contains ID of the original slot that was reslottet

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=zWgC27QhJ17luveL7F9Re-iOePU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/34</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/34&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=zWgC27QhJ17luveL7F9Re-iOePU&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;35cd49b6a5dfaff763cf7fdae72ebe34&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 5fb2468b-9bb4-43eb-bfaf-e8b55fcc8e7e
X-Runtime: 0.014348
Vary: Origin
Content-Length: 958</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 34,
  "title" : "Timeslot",
  "startDate" : "2019-09-10T15:44:02.000Z",
  "createdAt" : "2016-01-21T23:11:39.928Z",
  "updatedAt" : "2016-01-21T23:11:39.928Z",
  "deletedAt" : null,
  "endDate" : "2019-10-10T15:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 193,
    "username" : "User 270",
    "createdAt" : "2016-01-21T23:11:39.903Z",
    "updatedAt" : "2016-01-21T23:11:39.903Z",
    "deletedAt" : null,
    "image" : ""
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 28,
      "publicId" : "dfhjghjkdisudgfds7iy63",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-01-21T23:11:39.981Z"
    },
    {
      "mediaId" : 27,
      "publicId" : "dfhjghjkdisudgfds7iy62",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-01-21T23:11:39.977Z"
    },
    {
      "mediaId" : 26,
      "publicId" : "dfhjghjkdisudgfds7iy61",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-01-21T23:11:39.972Z"
    }
  ],
  "settings" : {
    "alerts" : "omitted"
  },
  "visibility" : "public",
  "reslotsCounter" : 1,
  "slotter" : {
    "id" : 197
  },
  "parent" : {
    "id" : 33
  },
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
