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
Authorization: Token token=56F_LFlcKXmSXwkrElj6lcpnLn0
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/39</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/39&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=56F_LFlcKXmSXwkrElj6lcpnLn0&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;2fbda8657cabde807fb8a50dc1580621&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ba9157ac-0baf-4600-8e5e-2d5a3d226d2f
X-Runtime: 0.017894
Vary: Origin
Content-Length: 958</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 39,
  "title" : "Timeslot",
  "startDate" : "2019-09-09T14:44:02.000Z",
  "createdAt" : "2015-12-23T11:18:33.774Z",
  "updatedAt" : "2015-12-23T11:18:33.774Z",
  "deletedAt" : null,
  "endDate" : "2019-10-09T14:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 195,
    "username" : "User 262",
    "createdAt" : "2015-12-23T11:18:33.752Z",
    "updatedAt" : "2015-12-23T11:18:33.752Z",
    "deletedAt" : null,
    "image" : ""
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 34,
      "publicId" : "dfhjghjkdisudgfds7iy69",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-12-23T11:18:33.829Z"
    },
    {
      "mediaId" : 33,
      "publicId" : "dfhjghjkdisudgfds7iy68",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-12-23T11:18:33.824Z"
    },
    {
      "mediaId" : 32,
      "publicId" : "dfhjghjkdisudgfds7iy67",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-12-23T11:18:33.818Z"
    }
  ],
  "settings" : {
    "alerts" : "omitted"
  },
  "reslotsCounter" : 1,
  "slotter" : {
    "id" : 199
  },
  "parent" : {
    "id" : 38
  },
  "visibility" : "public",
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
