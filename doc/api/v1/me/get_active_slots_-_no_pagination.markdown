# Me API

## Get active slots - no pagination

### GET /v1/me/slots

Returns an array which includes all Slots the current user is tagged to or which are in a calendar the current user is subscribed to.

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

<pre>Authorization: Token token=pKYTWh3dCVwE7-BvyW89WXDYj6E
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/slots</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/me/slots&quot; -X GET \
	-H &quot;Authorization: Token token=pKYTWh3dCVwE7-BvyW89WXDYj6E&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;ddf6d57a82b28cda957c6d732ecf83e3&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 382d0ebe-c077-4312-9214-6f1fc98f7271
X-Runtime: 0.082802
Content-Length: 2972</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
