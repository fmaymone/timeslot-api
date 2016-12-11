# Users API

## Get calendar with preview slots

### GET /v1/users/:id/calendars

### Parameters

Name : id
Description : ID of the user to get the calendars for.

### Request

#### Headers

<pre>Authorization: Token token=fkb9_tLuhawDOKZFtTHuBzxjZjo
Accept: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/202/calendars</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/202/calendars&quot; -X GET \
	-H &quot;Authorization: Token token=fkb9_tLuhawDOKZFtTHuBzxjZjo&quot; \
	-H &quot;Accept: application/json&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;9e9c070be7b88dfef83fd1bed533ac21&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7233906c-8544-47b1-82f1-3a9759c30d06
X-Runtime: 0.026112
Content-Length: 1938</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "result" : [
    {
      "id" : "4bb96ae5-efef-49ac-86f3-38e3d13d5386",
      "name" : "Testgroup 271",
      "image" : "",
      "description" : null,
      "defaultColor" : "000000",
      "membersCanPost" : false,
      "membersCanInvite" : false,
      "public" : true,
      "createdAt" : "2016-12-11T19:54:42.651Z",
      "updatedAt" : "2016-12-11T19:54:42.651Z",
      "deletedAt" : null,
      "owner" : {
        "id" : 202,
        "username" : "User 941",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-12-11T19:54:42.648Z",
        "updatedAt" : "2016-12-11T19:54:42.648Z",
        "deletedAt" : null,
        "image" : ""
      },
      "memberIds" : [
        202
      ],
      "memberCount" : 1,
      "slotCount" : 3,
      "previewSlots" : [
        {
          "id" : 89,
          "title" : "Slot title 252",
          "description" : "",
          "startDate" : "2019-09-10T12:44:02.000Z",
          "rrule" : "",
          "createdAt" : "2016-12-11T19:54:42.678Z",
          "updatedAt" : "2016-12-11T19:54:42.678Z",
          "deletedAt" : null,
          "endDate" : "2019-10-10T12:44:02.000Z",
          "location" : null,
          "creator" : {
            "id" : 205,
            "username" : "User 944",
            "firstName" : null,
            "middleName" : null,
            "lastName" : null,
            "createdAt" : "2016-12-11T19:54:42.674Z",
            "updatedAt" : "2016-12-11T19:54:42.674Z",
            "deletedAt" : null,
            "image" : ""
          },
          "media" : []
        },
        {
          "id" : 88,
          "title" : "Slot title 251",
          "description" : "",
          "startDate" : "2019-09-09T11:44:02.000Z",
          "rrule" : "",
          "createdAt" : "2016-12-11T19:54:42.670Z",
          "updatedAt" : "2016-12-11T19:54:42.670Z",
          "deletedAt" : null,
          "endDate" : "2019-10-09T11:44:02.000Z",
          "location" : null,
          "creator" : {
            "id" : 204,
            "username" : "User 943",
            "firstName" : null,
            "middleName" : null,
            "lastName" : null,
            "createdAt" : "2016-12-11T19:54:42.666Z",
            "updatedAt" : "2016-12-11T19:54:42.666Z",
            "deletedAt" : null,
            "image" : ""
          },
          "media" : []
        },
        {
          "id" : 87,
          "title" : "Slot title 250",
          "description" : "",
          "startDate" : "2019-09-08T10:44:02.000Z",
          "rrule" : "",
          "createdAt" : "2016-12-11T19:54:42.662Z",
          "updatedAt" : "2016-12-11T19:54:42.662Z",
          "deletedAt" : null,
          "endDate" : "2019-10-08T10:44:02.000Z",
          "location" : null,
          "creator" : {
            "id" : 203,
            "username" : "User 942",
            "firstName" : null,
            "middleName" : null,
            "lastName" : null,
            "createdAt" : "2016-12-11T19:54:42.658Z",
            "updatedAt" : "2016-12-11T19:54:42.658Z",
            "deletedAt" : null,
            "image" : ""
          },
          "media" : []
        }
      ]
    }
  ]
}
```
