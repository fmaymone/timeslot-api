# Me API

## Get slot library - no pagination

### GET /v1/me/library

Returns an array which includes all Slots the current user has created, was or is tagged to and all slots from calendars the current users has subscribed to.

Also slots which the current user had once in his schedule but removed them are included.

The slots are ordered by startdate, enddate, ID.

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

<pre>Authorization: Token token=YYuVyiwvEiT3U43MObkbCedAvyw
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/library</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/me/library&quot; -X GET \
	-H &quot;Authorization: Token token=YYuVyiwvEiT3U43MObkbCedAvyw&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;889250189ac77ce3ef232e11b696c4e7&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d96074be-7614-4f9f-9e08-4d885b0da126
X-Runtime: 0.109735
Content-Length: 1247</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
