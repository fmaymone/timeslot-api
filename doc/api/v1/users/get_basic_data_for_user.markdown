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
Authorization: Token token=-9D0lzIxaMJvgQ7gqhmRFtNJXnE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/110</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/110&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=-9D0lzIxaMJvgQ7gqhmRFtNJXnE&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;6fc99b1d2d7caf86b2fd7e34e0931e2c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 05685e7c-11b4-452a-abea-85feb3959bbd
X-Runtime: 0.061997
Content-Length: 656</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 110,
  "username" : "User 825",
  "firstName" : null,
  "middleName" : null,
  "lastName" : null,
  "createdAt" : "2016-08-30T09:51:10.959Z",
  "updatedAt" : "2016-08-30T09:51:10.959Z",
  "deletedAt" : null,
  "image" : "",
  "location" : {
    "id" : "79fc6123-3ec3-4f86-bdc4-cee7c3e4fe09",
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
    "longitude" : -11.993,
    "placeId" : null
  },
  "slotCount" : 0,
  "calendarCount" : 0,
  "friendsCount" : 0,
  "friendshipState" : "stranger",
  "previewSlots" : []
}
```
