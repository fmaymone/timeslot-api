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
Authorization: Token token=Dbh02dJA-6YYkUQPjn0cgmrNoi4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/106</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/106&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=Dbh02dJA-6YYkUQPjn0cgmrNoi4&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;cb6663a439b472244ebf46184d364e78&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 64aebc3f-d8f3-4497-87d1-2e5197b8ff36
X-Runtime: 0.017298
Vary: Origin
Content-Length: 557</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 106,
  "username" : "User 391",
  "createdAt" : "2015-12-04T16:56:54.208Z",
  "updatedAt" : "2015-12-04T16:56:54.208Z",
  "deletedAt" : null,
  "image" : "",
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
    "country" : null,
    "isoCountryCode" : null,
    "inLandWater" : null,
    "ocean" : null,
    "areasOfInterest" : null,
    "latitude" : 51.234,
    "longitude" : -11.993,
    "privateLocation" : false
  },
  "slotCount" : 0,
  "reslotCount" : 0,
  "friendsCount" : 0,
  "friendshipState" : "stranger"
}
```
