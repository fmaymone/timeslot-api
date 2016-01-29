# Slots API

## Delete StandardSlot

### DELETE /v1/stdslot/:id

Sets &#39;deletedAt&#39;, returns updated Standard Slot data. Doesn&#39;t delete anything.

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the Standard Slot to delete


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

<pre>Authorization: Token token=xh5_mTjyjoPwv9prL9wbUKtoKTs
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/stdslot/8</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/stdslot/8&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=xh5_mTjyjoPwv9prL9wbUKtoKTs&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;da82d8b5306039e1c0a2412c7507a654&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7dede918-7c1c-4684-8159-abfc85f89ca3
X-Runtime: 0.219727
Vary: Origin
Content-Length: 578</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 8,
  "title" : "Slot title 90",
  "startDate" : "2019-09-14T22:44:02.000Z",
  "createdAt" : "2016-01-29T19:39:12.453Z",
  "updatedAt" : "2016-01-29T19:39:12.560Z",
  "deletedAt" : "2016-01-29T19:39:12.553Z",
  "endDate" : "2019-10-14T22:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 19,
    "username" : "User 349",
    "createdAt" : "2016-01-29T19:39:12.371Z",
    "updatedAt" : "2016-01-29T19:39:12.371Z",
    "deletedAt" : null,
    "image" : "",
    "location" : null,
    "slotCount" : 0,
    "reslotCount" : 0,
    "friendsCount" : 0
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
```
