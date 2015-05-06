# Slots API

## Add photo

### PATCH /v1/stdslot/:id

First a cloudinary signature needs to be fetched by the client from the API. After uploading the image to cloudinary client updates the slot with the image information.

returns 422 if the media data is invalid

returns 200 and slot details including the new mediaID

### Parameters

Name : id *- required -*
Description : ID of the slot to update

Name : photos *- required -*
Description : Scope for array of new photos/voices/videos

Name : publicId *- required -*
Description : Cloudinary ID / URL

Name : position
Description : Sorting order of the new media item. If not submitted it will be added at the end


### Response Fields

Name : mediaItemId
Description : Timeslot internal ID for this media item

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=QSKdms1qiMUbpWgfyfBiX-LvZNo
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/stdslot/34</pre>

#### Body

<pre>{"photos":[{"publicId":"v1234567/dfhjghjkdisudgfds7iyf.jpg","position":"1"}]}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/stdslot/34&quot; -d &#39;{&quot;photos&quot;:[{&quot;publicId&quot;:&quot;v1234567/dfhjghjkdisudgfds7iyf.jpg&quot;,&quot;position&quot;:&quot;1&quot;}]}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=QSKdms1qiMUbpWgfyfBiX-LvZNo&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;f2b44a358d174c4edf4e7e51bc6b2f28&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 744438b1-47ba-4f0c-9c44-5f70ec21f6a3
X-Runtime: 0.042939
Content-Length: 582</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "id" : 34,
  "title" : "Slot title 32",
  "createdAt" : "2015-05-06T11:28:51.038Z",
  "updatedAt" : "2015-05-06T11:28:51.038Z",
  "deletedAt" : null,
  "startDate" : "2014-09-28T13:31:02.000Z",
  "endDate" : "2014-10-06T08:44:02.000Z",
  "visibility" : "private",
  "location" : null,
  "creator" : {
    "id" : 157,
    "username" : "User 157",
    "createdAt" : "2015-05-06T11:28:51.036Z",
    "updatedAt" : "2015-05-06T11:28:51.036Z",
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
      "mediaId" : 31,
      "clyid" : "v1234567/dfhjghjkdisudgfds7iyf.jpg",
      "postition" : 1
    }
  ],
  "voices" : [],
  "videos" : []
}</pre>
