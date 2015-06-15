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
Authorization: Token token=QN_ZJTLWfHcholUHSeWAaGMyRi8
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/227</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/227&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=QN_ZJTLWfHcholUHSeWAaGMyRi8&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;f3b07f1b1f0d3fe2d7c88b04902f70b6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 62adda88-a9a1-4348-ac67-e0ad525b39ea
X-Runtime: 0.017616
Content-Length: 516</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 227,
  "username" : "User 223",
  "createdAt" : "2015-06-15T08:50:41.390Z",
  "updatedAt" : "2015-06-15T08:50:41.390Z",
  "deletedAt" : null,
  "location" : {
    "id" : 3,
    "name" : "Acapulco",
    "thoroughfare" : null,
    "subThoroughfare" : null,
    "locality" : null,
    "subLocality" : null,
    "administrativeArea" : null,
    "subAdministrativeArea" : null,
    "postalCode" : null,
    "isoCountryCode" : null,
    "inLandWater" : null,
    "ocean" : null,
    "areasOfInterest" : null,
    "latitude" : 51.234,
    "longitude" : -11.993
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
