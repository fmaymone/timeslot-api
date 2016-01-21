# Slots API

## Get multiple slots

### POST /v1/slots

if a user is authenticated the slot settings (alerts) will be included

returns 404 if an ID is invalid

### Parameters

Name : ids *- required -*
Description : Array of slot IDs to get


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
Description : Visibiltiy of the slot (private/friend/foaf/public)

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

Name : audios
Description : Audio recordings for the slot

Name : videos
Description : Videos recordings for the slot

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=dERlEASi29chsvyt5C2f9zb0yew
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots</pre>

#### Body
```javascript
{
  "ids" : [
    27,
    26
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots&quot; -d &#39;{&quot;ids&quot;:[27,26]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=dERlEASi29chsvyt5C2f9zb0yew&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;62966ef9c8c2182c210ff14c9f515af3&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 07225233-f286-4e00-9c44-66b9afe9cd08
X-Runtime: 0.032620
Vary: Origin
Content-Length: 1025</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 27,
    "title" : "Slot title 54",
    "startDate" : "2019-09-04T09:44:02.000Z",
    "createdAt" : "2016-01-21T23:11:39.649Z",
    "updatedAt" : "2016-01-21T23:11:39.649Z",
    "deletedAt" : null,
    "endDate" : "2019-10-04T09:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 176,
      "username" : "User 246",
      "createdAt" : "2016-01-21T23:11:39.645Z",
      "updatedAt" : "2016-01-21T23:11:39.645Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "private",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  },
  {
    "id" : 26,
    "title" : "Slot title 53",
    "startDate" : "2019-09-03T08:44:02.000Z",
    "createdAt" : "2016-01-21T23:11:39.632Z",
    "updatedAt" : "2016-01-21T23:11:39.632Z",
    "deletedAt" : null,
    "endDate" : "2019-10-03T08:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 175,
      "username" : "User 238",
      "createdAt" : "2016-01-21T23:11:39.626Z",
      "updatedAt" : "2016-01-21T23:11:39.626Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "private",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  }
]
```
