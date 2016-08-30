# Users API

## Get list of calendars of another user

### GET /v1/users/:id/calendars

Includes all public calendars of this user and non-public calendars where user and current user are members.

returns array of calendars with up to 4 preview slots per calendar

returns 404 if current user not friend with other user

### Parameters

Name : id
Description : ID of the user to get the calendars for.

### Request

#### Headers

<pre>Authorization: Token token=vTPx402lTekqiA6RHGdFUdeL7Xo
Accept: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/187/calendars</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/187/calendars&quot; -X GET \
	-H &quot;Authorization: Token token=vTPx402lTekqiA6RHGdFUdeL7Xo&quot; \
	-H &quot;Accept: application/json&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;74d1bd694ad66d70f1a4ce26259e9043&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4c27622a-5acb-480e-8a6d-55dfe481d1aa
X-Runtime: 0.054196
Content-Length: 3517</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "result" : [
    {
      "id" : "e9d9d044-b786-4517-8e44-b4a09be4add7",
      "name" : "Testgroup 252",
      "image" : "",
      "description" : null,
      "defaultColor" : "000000",
      "membersCanPost" : false,
      "membersCanInvite" : false,
      "public" : true,
      "createdAt" : "2016-08-30T09:51:12.742Z",
      "updatedAt" : "2016-08-30T09:51:12.742Z",
      "deletedAt" : null,
      "owner" : {
        "id" : 187,
        "username" : "User 918",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-08-30T09:51:12.699Z",
        "updatedAt" : "2016-08-30T09:51:12.699Z",
        "deletedAt" : null,
        "image" : ""
      },
      "memberIds" : [
        187
      ],
      "memberCount" : 1,
      "slotCount" : 0,
      "previewSlots" : []
    },
    {
      "id" : "9bb5a82f-6b7c-410e-be5a-b86a62351fcd",
      "name" : "Testgroup 253",
      "image" : "",
      "description" : null,
      "defaultColor" : "000000",
      "membersCanPost" : false,
      "membersCanInvite" : false,
      "public" : true,
      "createdAt" : "2016-08-30T09:51:12.757Z",
      "updatedAt" : "2016-08-30T09:51:12.757Z",
      "deletedAt" : null,
      "owner" : {
        "id" : 187,
        "username" : "User 918",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-08-30T09:51:12.699Z",
        "updatedAt" : "2016-08-30T09:51:12.699Z",
        "deletedAt" : null,
        "image" : ""
      },
      "memberIds" : [
        187
      ],
      "memberCount" : 1,
      "slotCount" : 0,
      "previewSlots" : []
    },
    {
      "id" : "db654bd9-cb34-4286-b576-dbca9165f77c",
      "name" : "Testgroup 254",
      "image" : "",
      "description" : null,
      "defaultColor" : "000000",
      "membersCanPost" : false,
      "membersCanInvite" : false,
      "public" : true,
      "createdAt" : "2016-08-30T09:51:12.767Z",
      "updatedAt" : "2016-08-30T09:51:12.767Z",
      "deletedAt" : null,
      "owner" : {
        "id" : 188,
        "username" : "User 919",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-08-30T09:51:12.765Z",
        "updatedAt" : "2016-08-30T09:51:12.765Z",
        "deletedAt" : null,
        "image" : ""
      },
      "memberIds" : [
        188,
        187
      ],
      "memberCount" : 2,
      "slotCount" : 3,
      "previewSlots" : [
        {
          "id" : 85,
          "title" : "Slot title 241",
          "description" : "",
          "startDate" : "2019-09-26T01:44:02.000Z",
          "createdAt" : "2016-08-30T09:51:12.800Z",
          "updatedAt" : "2016-08-30T09:51:12.800Z",
          "deletedAt" : null,
          "endDate" : "2019-10-26T01:44:02.000Z",
          "location" : null,
          "creator" : {
            "id" : 191,
            "username" : "User 922",
            "firstName" : null,
            "middleName" : null,
            "lastName" : null,
            "createdAt" : "2016-08-30T09:51:12.795Z",
            "updatedAt" : "2016-08-30T09:51:12.795Z",
            "deletedAt" : null,
            "image" : ""
          }
        },
        {
          "id" : 84,
          "title" : "Slot title 240",
          "description" : "",
          "startDate" : "2019-09-25T00:44:02.000Z",
          "createdAt" : "2016-08-30T09:51:12.791Z",
          "updatedAt" : "2016-08-30T09:51:12.791Z",
          "deletedAt" : null,
          "endDate" : "2019-10-25T00:44:02.000Z",
          "location" : null,
          "creator" : {
            "id" : 190,
            "username" : "User 921",
            "firstName" : null,
            "middleName" : null,
            "lastName" : null,
            "createdAt" : "2016-08-30T09:51:12.785Z",
            "updatedAt" : "2016-08-30T09:51:12.785Z",
            "deletedAt" : null,
            "image" : ""
          }
        },
        {
          "id" : 83,
          "title" : "Slot title 239",
          "description" : "",
          "startDate" : "2019-09-24T23:44:02.000Z",
          "createdAt" : "2016-08-30T09:51:12.781Z",
          "updatedAt" : "2016-08-30T09:51:12.781Z",
          "deletedAt" : null,
          "endDate" : "2019-10-24T23:44:02.000Z",
          "location" : null,
          "creator" : {
            "id" : 189,
            "username" : "User 920",
            "firstName" : null,
            "middleName" : null,
            "lastName" : null,
            "createdAt" : "2016-08-30T09:51:12.775Z",
            "updatedAt" : "2016-08-30T09:51:12.775Z",
            "deletedAt" : null,
            "image" : ""
          }
        }
      ]
    },
    {
      "id" : "ba1ecdb4-9e67-47f8-8081-7bd32014f8c8",
      "name" : "Testgroup 255",
      "image" : "",
      "description" : null,
      "defaultColor" : "000000",
      "membersCanPost" : false,
      "membersCanInvite" : false,
      "public" : false,
      "createdAt" : "2016-08-30T09:51:12.810Z",
      "updatedAt" : "2016-08-30T09:51:12.810Z",
      "deletedAt" : null,
      "owner" : {
        "id" : 192,
        "username" : "User 923",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-08-30T09:51:12.808Z",
        "updatedAt" : "2016-08-30T09:51:12.808Z",
        "deletedAt" : null,
        "image" : ""
      },
      "memberIds" : [
        192,
        193,
        187
      ],
      "memberCount" : 3,
      "slotCount" : 0,
      "previewSlots" : []
    }
  ]
}
```
