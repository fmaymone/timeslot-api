# Users API

## Get basic data for User

### GET /v1/users/:id

returns 404 if ID is invalid



### Parameters

Name : id *- required -*
Description : ID of the user to get


### Response Fields

Name : id
Description : ID of the user

Name : username
Description : Username of the user

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
Authorization: Token token=MkhIm9mpOHgrC53jDX-uEdU1_B8
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/124</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/124&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=MkhIm9mpOHgrC53jDX-uEdU1_B8&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;fed8f77cb99b8f849dba4888434a05c5&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f174be30-7944-4985-b139-b43d041346a3
X-Runtime: 0.028124
Vary: Origin
Content-Length: 572</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 124,
  "username" : "User 423",
  "createdAt" : "2016-04-04T20:50:33.514Z",
  "updatedAt" : "2016-04-04T20:50:33.514Z",
  "deletedAt" : null,
  "image" : "",
  "location" : {
    "id" : "488588dd-6f2c-4d24-bbc3-e3ac818b5654",
    "name" : "Acapulco",
    "thoroughfare" : null,
    "subThoroughfare" : null,
    "locality" : null,
    "subLocality" : null,
    "administrativeArea" : null,
    "subAdministrativeArea" : null,
    "postalCode" : null,
    "country" : null,
    "isoCountryCode" : null,
    "inLandWater" : null,
    "ocean" : null,
    "areasOfInterest" : null,
    "latitude" : 51.234,
    "longitude" : -11.993
  },
  "slotCount" : 0,
  "calendarCount" : 0,
  "friendsCount" : 0,
  "friendshipState" : "stranger"
}
```
