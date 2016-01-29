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
Authorization: Token token=mUnrXxbTwnHDDxWYJd9PqQl8XPE
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots</pre>

#### Body
```javascript
{
  "ids" : [
    2,
    1
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots&quot; -d &#39;{&quot;ids&quot;:[2,1]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=mUnrXxbTwnHDDxWYJd9PqQl8XPE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;0b476440c5960387242c50d2884280ed&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f9ab8b7b-cc24-4868-93c4-d7f189b4e28c
X-Runtime: 0.053663
Vary: Origin
Content-Length: 987</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 2,
    "title" : "Slot title 72",
    "startDate" : "2019-09-22T03:44:02.000Z",
    "createdAt" : "2016-01-29T19:39:08.783Z",
    "updatedAt" : "2016-01-29T19:39:08.783Z",
    "deletedAt" : null,
    "endDate" : "2019-10-22T03:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 3,
      "username" : "User 277",
      "createdAt" : "2016-01-29T19:39:08.775Z",
      "updatedAt" : "2016-01-29T19:39:08.775Z",
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
    "commentsCounter" : 0
  },
  {
    "id" : 1,
    "title" : "Slot title 71",
    "startDate" : "2019-09-21T02:44:02.000Z",
    "createdAt" : "2016-01-29T19:39:08.755Z",
    "updatedAt" : "2016-01-29T19:39:08.755Z",
    "deletedAt" : null,
    "endDate" : "2019-10-21T02:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 2,
      "username" : "User 269",
      "createdAt" : "2016-01-29T19:39:08.745Z",
      "updatedAt" : "2016-01-29T19:39:08.745Z",
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
    "commentsCounter" : 0
  }
]
```
