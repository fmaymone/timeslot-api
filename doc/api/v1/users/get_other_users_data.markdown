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
Authorization: Token token=LXV_hOIR8mODy-K8E68Li0ggo9M
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/229</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/229&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=LXV_hOIR8mODy-K8E68Li0ggo9M&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;449f6e503c34f604cf4081f437e36f8d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6393f1da-3f5c-4b93-96f3-a6edc6fae8dd
X-Runtime: 0.022312
Content-Length: 558</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 229,
  "username" : "User 225",
  "createdAt" : "2015-06-22T08:44:25.792Z",
  "updatedAt" : "2015-06-22T08:44:25.792Z",
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
    "publicId" : null,
    "localId" : null
  },
  "slotCount" : 0,
  "reslotCount" : 0,
  "friendsCount" : 0
}
```
