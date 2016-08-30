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

<pre>Authorization: Token token=IUcZ73zVrWDe4jXQCyGyf0P2J68
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/171/slots</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/171/slots&quot; -X GET \
	-H &quot;Authorization: Token token=IUcZ73zVrWDe4jXQCyGyf0P2J68&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;6cd201866de21a8534f829593b3e7e4a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 020270cf-f5b1-4381-9c52-1beece34627d
X-Runtime: 0.034363
Content-Length: 593</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 79,
    "title" : "Slot title 235",
    "description" : "",
    "startDate" : "2019-09-20T19:44:02.000Z",
    "createdAt" : "2016-08-30T09:51:12.479Z",
    "updatedAt" : "2016-08-30T09:51:12.479Z",
    "deletedAt" : null,
    "endDate" : "2019-10-20T19:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 171,
      "username" : "Joe",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-08-30T09:51:12.442Z",
      "updatedAt" : "2016-08-30T09:51:12.442Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "public",
    "likerIds" : [],
    "likes" : 0,
    "commentsCounter" : 0,
    "firstGroup" : null,
    "slotGroupUuids" : []
  }
]
```
