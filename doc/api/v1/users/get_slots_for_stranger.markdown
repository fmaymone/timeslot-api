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

<pre>Authorization: Token token=vtGnHL1g1EjbuvziUay3-kLWlVo
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/177/slots</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/users/177/slots&quot; -X GET \
	-H &quot;Authorization: Token token=vtGnHL1g1EjbuvziUay3-kLWlVo&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;fabf059424f5b08cf1946c7744457700&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 83fd89c3-62fa-4677-9a50-324b979a2645
X-Runtime: 0.063534
Content-Length: 619</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
