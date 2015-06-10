# Slots API

## Reorder media items

### PATCH /v1/stdslot/:id

An array with the media_item keys and corresponding position/ordering number (starting from 0) for all images of the slot must be send.

returns 404 if a mediaId doesn&#39;t exist

returns 422 if position params are invalid

returns 200 and slot details on success

### Parameters

Name : id *- required -*
Description : ID of the slot to update

Name : photos *- required -*
Description : Array with mediaIds and position parameter

Name : mediaId *- required -*
Description : Timeslot&#39;s internal ID for this media item

Name : position *- required -*
Description : Sorting order of the image/video/voice. If not supplied the media items will be sortet as they are ordered in the array.


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

<pre>Content-Type: application/json
Authorization: Token token=Y7hp1IDsnNVwEbsQtQ1HjHf0MJM
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/stdslot/38</pre>

#### Body
```javascript
{
  "photos" : [
    {
      "mediaId" : 32,
      "position" : 2
    },
    {
      "mediaId" : 33,
      "position" : 0
    },
    {
      "mediaId" : 34,
      "position" : 1
    }
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/stdslot/38&quot; -d &#39;{&quot;photos&quot;:[{&quot;mediaId&quot;:32,&quot;position&quot;:2},{&quot;mediaId&quot;:33,&quot;position&quot;:0},{&quot;mediaId&quot;:34,&quot;position&quot;:1}]}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=Y7hp1IDsnNVwEbsQtQ1HjHf0MJM&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;8ca5bbd6a936b207a08b745340ab6efd&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 44357395-76a4-4780-8050-ec14fecf5843
X-Runtime: 0.054882
Content-Length: 854</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 38,
  "title" : "Slot title 33",
  "startDate" : "2019-09-07T09:44:02.000Z",
  "createdAt" : "2015-06-10T11:53:26.029Z",
  "updatedAt" : "2015-06-10T11:53:26.029Z",
  "deletedAt" : null,
  "endDate" : "2019-10-07T09:44:02.000Z",
  "location" : {
    "id" : 35,
    "name" : "Acapulco",
    "street" : "",
    "city" : "",
    "postcode" : "",
    "country" : "",
    "latitude" : null,
    "longitude" : null
  },
  "creator" : {
    "id" : 205,
    "username" : "User 202",
    "createdAt" : "2015-06-10T11:53:26.020Z",
    "updatedAt" : "2015-06-10T11:53:26.020Z",
    "deletedAt" : null,
    "image" : null
  },
  "notes" : [],
  "photos" : [
    {
      "mediaId" : 33,
      "clyid" : "dfhjghjkdisudgfds7iy29",
      "position" : 0,
      "localId" : null
    },
    {
      "mediaId" : 34,
      "clyid" : "dfhjghjkdisudgfds7iy30",
      "position" : 1,
      "localId" : null
    },
    {
      "mediaId" : 32,
      "clyid" : "dfhjghjkdisudgfds7iy28",
      "position" : 2,
      "localId" : null
    }
  ],
  "voices" : [],
  "videos" : [],
  "settings" : {
    "alerts" : "0000000000"
  },
  "visibility" : "private",
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
