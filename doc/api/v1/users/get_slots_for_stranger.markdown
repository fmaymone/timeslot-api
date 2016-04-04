# Users API

## Get slots for Stranger

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots with visibility &#39;public&#39; and &#39;public&#39;-ReSlots

If a user is authenticated the slot settings (alerts) will be included.

### Parameters

Name : id
Description : ID of the user to get the slots for.


### Response Fields

Name : id
Description : ID of the slot

Name : title
Description : Title of the slot

Name : startDate
Description : Startdate of the slot

Name : endDate
Description : Enddate of the slot

Name : creatorId
Description : ID of the User who created the slot

Name : alerts
Description : Alerts for the slot for the current user

Name : notes
Description : A list of all notes on the slot

Name : likes
Description : Number of likes for the slot

Name : commentsCounter
Description : Number of comments on the slot

Name : images
Description : Images for the slot

Name : audios
Description : Audio recordings for the slot

Name : videos
Description : Videos for the slot

Name : url
Description : direct url to fetch the slot

Name : visibility
Description : Visibility if it&#39;s a StandardSlot

Name : createdAt
Description : Creation datetime of the slot

Name : updatedAt
Description : Last update of the slot

Name : deletedAt
Description : Deletion datetime of the slot

### Request

#### Headers

<pre>Authorization: Token token=0A7gnq8i_N6zH1Op7ko_FCfcaaw
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/175/slots</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/175/slots&quot; -X GET \
	-H &quot;Authorization: Token token=0A7gnq8i_N6zH1Op7ko_FCfcaaw&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;0215234a781ed8385383d3f05511dd2a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4737f615-a29b-40f0-aa6d-ed1a7b277b25
X-Runtime: 0.023929
Vary: Origin
Content-Length: 478</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 72,
    "title" : "Slot title 135",
    "startDate" : "2019-09-04T18:44:02.000Z",
    "createdAt" : "2016-04-04T20:50:34.521Z",
    "updatedAt" : "2016-04-04T20:50:34.521Z",
    "deletedAt" : null,
    "endDate" : "2019-10-04T18:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 179,
      "username" : "User 475",
      "createdAt" : "2016-04-04T20:50:34.515Z",
      "updatedAt" : "2016-04-04T20:50:34.515Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0
  }
]
```
