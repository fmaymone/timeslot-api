# Slots API

## Share slot

### GET /v1/slots/:id/share

if a user is authenticated the slot shareUrl will be included

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the slot to share


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
Description : Visibiltiy of the slot

Name : notes
Description : Notes on the slot

Name : likes
Description : Likes for the slot

Name : commentsCounter
Description : Number of comments on the slot

Name : reslotsCounter
Description : Number of reslots for this slot

Name : shareUrl
Description : Share URL for this slot, nil if not yet shared

Name : images
Description : Images for the slot

Name : audios
Description : Audio recordings for the slot

Name : videos
Description : Videos recordings for the slot

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=3Qs-FlHpCsaRGLhqIrW6eJpGjNA
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/77/share</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/77/share&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=3Qs-FlHpCsaRGLhqIrW6eJpGjNA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;3a3d45cba11628e933e418233a891b81&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 26ae2595-1994-49c0-9f2f-0c8f6e7a629d
X-Runtime: 0.049468
Vary: Origin
Content-Length: 571</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 77,
  "title" : "Slot title 62",
  "startDate" : "2019-09-09T14:44:02.000Z",
  "createdAt" : "2015-09-20T18:49:38.723Z",
  "updatedAt" : "2015-09-20T18:49:38.819Z",
  "deletedAt" : null,
  "endDate" : "2019-10-09T14:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 327,
    "username" : "User 291",
    "createdAt" : "2015-09-20T18:49:38.649Z",
    "updatedAt" : "2015-09-20T18:49:38.649Z",
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
  "visibility" : "public",
  "reslotsCounter" : 0,
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : "http://localhost:3100/XZwvqYuU"
}
```
