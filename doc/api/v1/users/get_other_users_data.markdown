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
Authorization: Token token=NwYd4-IK2jaO-pN-hWmlZSJoEj8
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/229</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/229&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=NwYd4-IK2jaO-pN-hWmlZSJoEj8&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;5c86943f6b0db7ebda33b7a8119a3941&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d45e2fae-29bb-4940-b18a-0f9f01313b97
X-Runtime: 0.015419
Content-Length: 555</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 229,
  "username" : "User 225",
  "createdAt" : "2015-06-15T11:19:15.727Z",
  "updatedAt" : "2015-06-15T11:19:15.727Z",
  "deletedAt" : null,
  "location" : {
    "id" : 4,
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
    "clyid" : null,
    "localId" : null
  },
  "slotCount" : 0,
  "reslotCount" : 0,
  "friendsCount" : 0
}
```
