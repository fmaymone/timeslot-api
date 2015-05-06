# Slots API

## Move Slot from private Slots to Friend Slots

### POST /v1/slots/:id/move

A new slot will be created with  the same Metadata as it&#39;s source. Either slotType or groupId must be provided! If details is set to &#39;true&#39; all media items and notes will be duplicated. The source will be deleted afterwards and with it all comments and likes.

### Parameters

Name : slotType
Description : Type of slot to move to. Must be own of [private/friends/public]

Name : groupId
Description : Contains the group ID if moving into a group User must be allowed to post to this group

Name : details
Description : Move all media data and notes to the new  slot. Otherwise they will be deleted.

Defaults to &#39;true&#39;, must be one of [true/false]

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=7g-xCHJq3tBmk4vFPVLZiDJCR14
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/56/move</pre>

#### Body

<pre>{"slotType":"friends","details":"true"}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/slots/56/move&quot; -d &#39;{&quot;slotType&quot;:&quot;friends&quot;,&quot;details&quot;:&quot;true&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=7g-xCHJq3tBmk4vFPVLZiDJCR14&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;be6666dead1c3c9d7d8d578a8a153823&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a6cfb4e2-199a-4380-b137-d0449af9fdaf
X-Runtime: 0.059007
Content-Length: 694</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "id" : 57,
  "title" : "Slot title 49",
  "createdAt" : "2015-05-06T11:28:51.841Z",
  "updatedAt" : "2015-05-06T11:28:51.841Z",
  "deletedAt" : null,
  "startDate" : "2014-09-28T13:31:02.000Z",
  "endDate" : "2014-10-23T01:44:02.000Z",
  "visibility" : "friends",
  "location" : null,
  "creator" : {
    "id" : 210,
    "username" : "User 210",
    "createdAt" : "2015-05-06T11:28:51.821Z",
    "updatedAt" : "2015-05-06T11:28:51.821Z",
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
      "mediaId" : 46,
      "clyid" : "dfhjghjkdisudgfds7iy39",
      "postition" : 0
    },
    {
      "mediaId" : 47,
      "clyid" : "dfhjghjkdisudgfds7iy40",
      "postition" : 1
    },
    {
      "mediaId" : 48,
      "clyid" : "dfhjghjkdisudgfds7iy41",
      "postition" : 2
    }
  ],
  "voices" : [],
  "videos" : []
}</pre>
