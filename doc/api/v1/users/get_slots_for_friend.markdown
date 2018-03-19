# Users API

## Get slots for Friend

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots with visibility &#39;friend&#39;, &#39;foaf&#39; (friend-of-friend) or &#39;public&#39;, ReSlots &amp; shared GroupSlots

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

<pre>Authorization: Token token=kdu5ZU-A0yisToWhe7Mnv4AXxhs
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/156/slots</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/users/156/slots&quot; -X GET \
	-H &quot;Authorization: Token token=kdu5ZU-A0yisToWhe7Mnv4AXxhs&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;5a2cc9c4a6ebe74310cfc62462e76825&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f9da2adc-de66-47aa-879b-42a2637fc739
X-Runtime: 0.077222
Content-Length: 1854</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
