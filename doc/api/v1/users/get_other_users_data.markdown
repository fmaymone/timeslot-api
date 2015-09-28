# Users API

## Get other users data

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

Name : image
Description : URL of the user image

Name : location
Description : Home location of user

Name : push
Description : Send push Notifications (true/false)

Name : createdAt
Description : Creation of user

Name : updatedAt
Description : Latest update of user in db

Name : deletedAt
Description : Deletion of user

Name : slotCount
Description : Number of slots for this user

Name : reslotCount
Description : Number of reslots for this user

Name : friendsCount
Description : Number of friends for this user

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=ZCfzT6uzge8RxG8OAftQlkXFxX4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/333</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/333&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=ZCfzT6uzge8RxG8OAftQlkXFxX4&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;2ff74edcd4b7bf26ca15fbd8a7581730&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: dbc8fa46-cc0f-4888-828b-77dc9a924612
X-Runtime: 0.019113
Vary: Origin
Content-Length: 558</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 333,
  "username" : "User 296",
  "createdAt" : "2015-09-28T10:15:59.525Z",
  "updatedAt" : "2015-09-28T10:15:59.525Z",
  "deletedAt" : null,
  "location" : {
    "id" : 6,
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
    "privateLocation" : false
  },
  "image" : {
    "publicId" : null,
    "localId" : null
  },
  "slotCount" : 0,
  "reslotCount" : 0,
  "friendsCount" : 0
}
```
