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


### Response Fields

Name : id
Description : ID of the slot

Name : title
Description : Title of the slot

Name : startDate
Description : Startdate of the slot

Name : endDate
Description : Enddate of the slot

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
Description : Visibiltiy of the slot

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

Name : voices
Description : Voice recordings for the slot

Name : videos
Description : Videos recordings for the slot

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=wxQV3daGu047N_D0Qwa8Nst37Tg
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/stdslot/35</pre>

#### Body
```javascript
{
  "title" : "New title for a Slot"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/stdslot/35&quot; -d &#39;{&quot;title&quot;:&quot;New title for a Slot&quot;}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=wxQV3daGu047N_D0Qwa8Nst37Tg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;bb5558ba0a7df37cc24d2dce7bfc8bcc&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ad332821-6268-4274-ba4d-fd414dd8a741
X-Runtime: 0.037911
Content-Length: 634</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 35,
  "title" : "New title for a Slot",
  "startDate" : "2014-09-28T13:31:02.000Z",
  "createdAt" : "2015-06-03T10:39:38.722Z",
  "updatedAt" : "2015-06-03T10:39:38.722Z",
  "deletedAt" : null,
  "endDate" : "2014-10-04T06:44:02.000Z",
  "location" : {
    "id" : 32,
    "name" : "Acapulco",
    "street" : "",
    "city" : "",
    "postcode" : "",
    "country" : "",
    "latitude" : null,
    "longitude" : null
  },
  "creator" : {
    "id" : 196,
    "username" : "User 193",
    "createdAt" : "2015-06-03T10:39:38.712Z",
    "updatedAt" : "2015-06-03T10:39:38.712Z",
    "deletedAt" : null,
    "image" : null
  },
  "notes" : [],
  "photos" : [],
  "voices" : [],
  "videos" : [],
  "settings" : {
    "alerts" : "0000000000"
  },
  "visibility" : "private",
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
