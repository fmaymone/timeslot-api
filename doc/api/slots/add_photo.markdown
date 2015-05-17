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
Authorization: Token token=RbBaaHGTdY_2CZKIl4SFhqk4hgA
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/stdslot/34</pre>

#### Body
```javascript
{
  "photos" : [
    {
      "publicId" : "v1234567/dfhjghjkdisudgfds7iyf.jpg",
      "position" : "1"
    }
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/stdslot/34&quot; -d &#39;{&quot;photos&quot;:[{&quot;publicId&quot;:&quot;v1234567/dfhjghjkdisudgfds7iyf.jpg&quot;,&quot;position&quot;:&quot;1&quot;}]}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=RbBaaHGTdY_2CZKIl4SFhqk4hgA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;f15819942df8ae97931d255796016f9b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 0237c448-2310-4d36-bbec-8f4d6c36a434
X-Runtime: 0.036814
Content-Length: 582</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 34,
  "title" : "Slot title 32",
  "createdAt" : "2015-05-06T21:29:33.679Z",
  "updatedAt" : "2015-05-06T21:29:33.679Z",
  "deletedAt" : null,
  "startDate" : "2014-09-28T13:31:02.000Z",
  "endDate" : "2014-10-06T08:44:02.000Z",
  "visibility" : "private",
  "location" : null,
  "creator" : {
    "id" : 157,
    "username" : "User 157",
    "createdAt" : "2015-05-06T21:29:33.677Z",
    "updatedAt" : "2015-05-06T21:29:33.677Z",
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
}
```
