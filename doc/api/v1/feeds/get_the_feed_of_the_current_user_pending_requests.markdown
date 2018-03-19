# Feeds API

## Get the feed of the current user pending requests

### GET /v1/feed/request

### Parameters

Name : limit
Description : Maximum count of items which are included in the result

Name : offset
Description : The offset value how many result items should be skipped before the limits start counting (or use cursor instead)

Name : cursor
Description : The ID of the activity to start loading from (not included) (or use offset instead)


### Response Fields

Name : id
Description : ID of the user

Name : username
Description : Username of the user

Name : firstName
Description : First name of the user

Name : middleName
Description : Middle name of the user

Name : lastName
Description : Last name of the user

Name : createdAt
Description : Creation of user

Name : updatedAt
Description : Latest update of user in db

Name : deletedAt
Description : Deletion of user

Name : image
Description : URL of the user image

Name : location
Description : Home location of user

Name : slotCount
Description : Number of visible slots for this user

Name : calendarCount
Description : Number of visible calendars for this user

Name : friendsCount
Description : Number of friends for this user

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=CVZIfZEvIzqeuoAJ9V3Hlw-NeOk
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/feed/request</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/feed/request&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=CVZIfZEvIzqeuoAJ9V3Hlw-NeOk&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;7edda4745f21817a62de8d4a2d510fd6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8eb86e67-43b2-46b7-809a-3944d4740f25
X-Runtime: 0.021232
Content-Length: 1932</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
