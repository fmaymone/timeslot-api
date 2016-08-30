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
Authorization: Token token=dD7ypU4G--CK0gM-uA-gsCqiSyI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/feed/request</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/feed/request&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=dD7ypU4G--CK0gM-uA-gsCqiSyI&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;939694bfb9bffb5aa4d65106ed4b91b8&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2a65f000-2bf4-4420-8fff-d637c2ba7834
X-Runtime: 0.006570
Content-Length: 1929</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "cursor" : 0,
  "next" : null,
  "prev" : null,
  "results" : [
    {
      "target" : "user",
      "action" : "request",
      "time" : "2016-08-30T09:50:49.057Z",
      "id" : "60227A945EDCAB0A9E3BA3A926835C429696060C",
      "message" : "{actor} sent a friend request to you",
      "actors" : [
        {
          "id" : 278,
          "username" : "Friend C",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-08-30T09:50:48.973Z",
          "updatedAt" : "2016-08-30T09:50:48.973Z",
          "deletedAt" : null,
          "image" : ""
        }
      ],
      "group" : null,
      "slot" : null,
      "user" : {
        "id" : 279,
        "username" : "User 387",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-08-30T09:50:48.978Z",
        "updatedAt" : "2016-08-30T09:50:48.978Z",
        "deletedAt" : null,
        "image" : "",
        "friendshipState" : "pending passive"
      }
    },
    {
      "target" : "user",
      "action" : "request",
      "time" : "2016-08-30T09:50:49.028Z",
      "id" : "458C4F369622CC360A3AB89D17A4DC93AE7CAE04",
      "message" : "{actor} sent a friend request to you",
      "actors" : [
        {
          "id" : 277,
          "username" : "Friend B",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-08-30T09:50:48.970Z",
          "updatedAt" : "2016-08-30T09:50:48.970Z",
          "deletedAt" : null,
          "image" : ""
        }
      ],
      "group" : null,
      "slot" : null,
      "user" : {
        "id" : 279,
        "username" : "User 387",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-08-30T09:50:48.978Z",
        "updatedAt" : "2016-08-30T09:50:48.978Z",
        "deletedAt" : null,
        "image" : "",
        "friendshipState" : "pending passive"
      }
    },
    {
      "target" : "user",
      "action" : "request",
      "time" : "2016-08-30T09:50:48.988Z",
      "id" : "5D87EA6EE9EC085D0B2E88CDFC72028F1C8A50D4",
      "message" : "{actor} sent a friend request to you",
      "actors" : [
        {
          "id" : 276,
          "username" : "Friend A",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-08-30T09:50:48.967Z",
          "updatedAt" : "2016-08-30T09:50:48.967Z",
          "deletedAt" : null,
          "image" : ""
        }
      ],
      "group" : null,
      "slot" : null,
      "user" : {
        "id" : 279,
        "username" : "User 387",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-08-30T09:50:48.978Z",
        "updatedAt" : "2016-08-30T09:50:48.978Z",
        "deletedAt" : null,
        "image" : "",
        "friendshipState" : "pending passive"
      }
    }
  ]
}
```
