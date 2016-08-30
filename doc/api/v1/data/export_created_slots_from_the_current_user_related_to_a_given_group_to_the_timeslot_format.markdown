# Data API

## Export created Slots from the current user related to a given Group to the Timeslot format

### POST /v1/export/timeslot

### Parameters

Name : group
Description : Holds the uuid of the slot group which should be exported.

If the parameter group is missing, all Slot will be exported.

If the group uuid was not found, no Slot will be exported.

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=hSLvI5QvRb6yNvTNGH3T2J-vmTM
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/timeslot</pre>

#### Body
```javascript
{
  "group" : "92294975-d015-4bad-9b2a-75d0d43b2c39"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/export/timeslot&quot; -d &#39;{&quot;group&quot;:&quot;92294975-d015-4bad-9b2a-75d0d43b2c39&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=hSLvI5QvRb6yNvTNGH3T2J-vmTM&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;92294975-d015-4bad-9b2a-75d0d43b2c39.json&quot;
Content-Transfer-Encoding: binary
Content-Type: application/json
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;1687f7724a415142587b2755b43b7898&quot;
X-Request-Id: 44d27ba6-6a82-4dd9-b465-1e1754a6cb9e
X-Runtime: 0.014018
Content-Length: 1233</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "uid" : "8d53b03b-3a23-4051-8f09-3f45ea7f0713",
    "title" : "Slot title 71",
    "visibility" : "public",
    "start" : "2019-09-18T23:44:02.000Z",
    "end" : "2019-10-18T23:44:02.000Z",
    "media" : [
      {
        "public_id" : "dfhjghjkdisudgfds7iy321",
        "media_type" : "audio",
        "position" : 17,
        "duration" : null,
        "title" : "Title 321"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy320",
        "media_type" : "video",
        "position" : 16,
        "duration" : null,
        "title" : "Title 320"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy319",
        "media_type" : "video",
        "position" : 15,
        "duration" : null,
        "title" : "Title 319"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy318",
        "media_type" : "image",
        "position" : 14,
        "duration" : null,
        "title" : "Title 318"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy317",
        "media_type" : "image",
        "position" : 13,
        "duration" : null,
        "title" : "Title 317"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy316",
        "media_type" : "image",
        "position" : 12,
        "duration" : null,
        "title" : "Title 316"
      }
    ],
    "notes" : [
      {
        "title" : "Title for Note 160",
        "content" : "Liebe ist ein Kind der Freiheit!"
      },
      {
        "title" : "Title for Note 159",
        "content" : "Liebe ist ein Kind der Freiheit!"
      },
      {
        "title" : "Title for Note 158",
        "content" : "Liebe ist ein Kind der Freiheit!"
      }
    ],
    "settings" : [],
    "groups" : [
      {
        "uuid" : "92294975-d015-4bad-9b2a-75d0d43b2c39",
        "name" : "Testgroup 101",
        "image" : "",
        "public" : false,
        "description" : null
      }
    ],
    "location" : null
  }
]
```
