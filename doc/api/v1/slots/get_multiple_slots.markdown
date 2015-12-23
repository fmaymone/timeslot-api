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
Authorization: Token token=6vEfYm6d-yDuhd1VQ8WqRlsV2zc
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots</pre>

#### Body
```javascript
{
  "ids" : [
    32,
    31
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots&quot; -d &#39;{&quot;ids&quot;:[32,31]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=6vEfYm6d-yDuhd1VQ8WqRlsV2zc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;50eee06c00b699ba4bf505231b218a4e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e19d100e-ccbe-4758-8d57-a4d78831c6a8
X-Runtime: 0.031580
Vary: Origin
Content-Length: 1025</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 32,
    "title" : "Slot title 53",
    "startDate" : "2019-09-03T08:44:02.000Z",
    "createdAt" : "2015-12-23T11:18:33.518Z",
    "updatedAt" : "2015-12-23T11:18:33.518Z",
    "deletedAt" : null,
    "endDate" : "2019-10-03T08:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 178,
      "username" : "User 238",
      "createdAt" : "2015-12-23T11:18:33.510Z",
      "updatedAt" : "2015-12-23T11:18:33.510Z",
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
    "id" : 31,
    "title" : "Slot title 52",
    "startDate" : "2019-09-02T07:44:02.000Z",
    "createdAt" : "2015-12-23T11:18:33.500Z",
    "updatedAt" : "2015-12-23T11:18:33.500Z",
    "deletedAt" : null,
    "endDate" : "2019-10-02T07:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 177,
      "username" : "User 230",
      "createdAt" : "2015-12-23T11:18:33.495Z",
      "updatedAt" : "2015-12-23T11:18:33.495Z",
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
