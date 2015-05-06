# Slots API

## Update StdSlot

### PATCH /v1/stdslot/:id

Update content of StdSlot.

User must be owner of StdSlot.

returns 200 and slot data if update succeded 

returns 404 if User not owner or ID is invalid

returns 422 if parameters are invalid

### Parameters

Name : id *- required -*
Description : ID of the slot to update

Name : title
Description : Updated title of slot

Name : startDate
Description : Updated Startdate and Time of the Slot

Name : endDate
Description : Updated Enddate and Time of the Slot (startdate + duration)

Name : locationId
Description : Location ID

Name : visibility
Description : Visibility of slot

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=_X2rQIrJigfTkQcSZVOx5Kkkhiw
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/stdslot/32</pre>

#### Body

<pre>{
  "title" : "New title for a Slot"
}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/stdslot/32&quot; -d &#39;{&quot;title&quot;:&quot;New title for a Slot&quot;}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=_X2rQIrJigfTkQcSZVOx5Kkkhiw&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;be5d6aec839573ce6f8c467cc9f587dd&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c30f4537-cb09-4f97-a8da-150935d27d5f
X-Runtime: 0.027176
Content-Length: 516</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "id" : 32,
  "title" : "New title for a Slot",
  "createdAt" : "2015-05-06T14:45:16.365Z",
  "updatedAt" : "2015-05-06T14:45:16.365Z",
  "deletedAt" : null,
  "startDate" : "2014-09-28T13:31:02.000Z",
  "endDate" : "2014-10-04T06:44:02.000Z",
  "visibility" : "private",
  "location" : null,
  "creator" : {
    "id" : 153,
    "username" : "User 153",
    "createdAt" : "2015-05-06T14:45:16.363Z",
    "updatedAt" : "2015-05-06T14:45:16.363Z",
    "deletedAt" : null
  },
  "settings" : {
    "alerts" : "0000000000"
  },
  "notes" : [],
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null,
  "photos" : [],
  "voices" : [],
  "videos" : []
}</pre>
