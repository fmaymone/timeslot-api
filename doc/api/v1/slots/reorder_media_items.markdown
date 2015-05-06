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

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=JnyveJuEsc7nd4O5GyaCSkXnibg
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/stdslot/35</pre>

#### Body

<pre>{"photos":[{"mediaId":32,"position":2},{"mediaId":33,"position":0},{"mediaId":34,"position":1}]}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/stdslot/35&quot; -d &#39;{&quot;photos&quot;:[{&quot;mediaId&quot;:32,&quot;position&quot;:2},{&quot;mediaId&quot;:33,&quot;position&quot;:0},{&quot;mediaId&quot;:34,&quot;position&quot;:1}]}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=JnyveJuEsc7nd4O5GyaCSkXnibg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;8251fb84a1b26b2a98373c8a83b6f945&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: cd9202e0-a38f-471c-a3c3-64f6c11cf920
X-Runtime: 0.036285
Content-Length: 694</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "id" : 35,
  "title" : "Slot title 33",
  "createdAt" : "2015-05-06T11:28:51.099Z",
  "updatedAt" : "2015-05-06T11:28:51.099Z",
  "deletedAt" : null,
  "startDate" : "2014-09-28T13:31:02.000Z",
  "endDate" : "2014-10-07T09:44:02.000Z",
  "visibility" : "private",
  "location" : null,
  "creator" : {
    "id" : 159,
    "username" : "User 159",
    "createdAt" : "2015-05-06T11:28:51.097Z",
    "updatedAt" : "2015-05-06T11:28:51.097Z",
    "deletedAt" : null
  },
  "settings" : {
    "alerts" : "0000000000"
  },
  "notes" : [],
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null,
  "photos" : [
    {
      "mediaId" : 33,
      "clyid" : "dfhjghjkdisudgfds7iy29",
      "postition" : 0
    },
    {
      "mediaId" : 34,
      "clyid" : "dfhjghjkdisudgfds7iy30",
      "postition" : 1
    },
    {
      "mediaId" : 32,
      "clyid" : "dfhjghjkdisudgfds7iy28",
      "postition" : 2
    }
  ],
  "voices" : [],
  "videos" : []
}</pre>
