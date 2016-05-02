# Data API

## Export all created Slots of the current user to a file (Timeslot)

### POST /v1/export/timeslot

returns 404 if the group uuid was not found
returns 422 if parameters are invalid or missing
returns 500 if an error occurs during the export

### Parameters

Name : group
Description : Holds the uuid of the slot group which should be exported.
If the parameter group is missing, all Slot will be exported.
If the group uuid was not found, no Slot will be exported.

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=EN6PWcF0o37n4fHxCeWSCk9JF7E
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/timeslot</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/export/timeslot&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=EN6PWcF0o37n4fHxCeWSCk9JF7E&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;Timeslot-Export.json&quot;
Content-Transfer-Encoding: binary
Content-Type: application/json
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;4330c0d3e368a3436002e6e6fbf03ec3&quot;
X-Request-Id: dab7a285-0273-4a14-9cf0-dbb502cce81d
X-Runtime: 0.012443
Content-Length: 886</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "uid" : "0845ce4a-fddc-4763-9b0b-a9b71b43027c",
    "title" : "Slot title 68",
    "visibility" : "public",
    "start" : "2019-09-15T20:44:02.000Z",
    "end" : "2019-10-15T20:44:02.000Z",
    "location" : null
  },
  {
    "uid" : "dea06f7b-3b54-4994-852f-5f0dcaf47a8c",
    "title" : "Slot title 67",
    "visibility" : "public",
    "start" : "2019-09-14T19:44:02.000Z",
    "end" : "2019-10-14T19:44:02.000Z",
    "location" : null
  },
  {
    "uid" : "add63601-b890-463c-9acf-1841c34c7782",
    "title" : "Slot title 66",
    "visibility" : "public",
    "start" : "2019-09-13T18:44:02.000Z",
    "end" : "2019-10-13T18:44:02.000Z",
    "location" : null
  },
  {
    "uid" : "b6649d08-7d7e-407a-9750-d38f4912a3e8",
    "title" : "Slot title 65",
    "visibility" : "public",
    "start" : "2019-09-12T17:44:02.000Z",
    "end" : "2019-10-12T17:44:02.000Z",
    "location" : null
  },
  {
    "uid" : "638b6626-1153-4f26-b2ad-94bf9652943c",
    "title" : "Slot title 64",
    "visibility" : "public",
    "start" : "2019-09-11T16:44:02.000Z",
    "end" : "2019-10-11T16:44:02.000Z",
    "location" : null
  }
]
```
