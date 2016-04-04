# Users API

## Get slots for Stranger with common groups

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots with visibility &#39;public&#39;, &#39;public&#39;-ReSlots &amp; shared GroupSlots

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

<pre>Authorization: Token token=1_Q19loCGxWTJSdGaEserfO_BQk
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/169/slots</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/169/slots&quot; -X GET \
	-H &quot;Authorization: Token token=1_Q19loCGxWTJSdGaEserfO_BQk&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;22c8d3e8699ea090ce067a20e37faff4&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 629ad9e5-1ce5-440f-b0e0-1fb709640261
X-Runtime: 0.024744
Vary: Origin
Content-Length: 478</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 68,
    "title" : "Slot title 131",
    "startDate" : "2019-09-27T14:44:02.000Z",
    "createdAt" : "2016-04-04T20:50:34.435Z",
    "updatedAt" : "2016-04-04T20:50:34.435Z",
    "deletedAt" : null,
    "endDate" : "2019-10-27T14:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 173,
      "username" : "User 470",
      "createdAt" : "2016-04-04T20:50:34.430Z",
      "updatedAt" : "2016-04-04T20:50:34.430Z",
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
