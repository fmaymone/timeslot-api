# Data API

## Export created Slots from the current user related to a given Group to the Google format

### POST /v1/export/google

### Parameters

Name : group
Description : Holds the uuid of the slot group which should be exported.

If the parameter group is missing, all Slot will be exported.

If the group uuid was not found, no Slot will be exported.

### Request

#### Headers

<pre>Content-Type: application/json
Accept: text/plain
Authorization: Token token=GDZ6FpMTBtcVp-76AQ06Mn0N6yc
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/google</pre>

#### Body
```javascript
{
  "group" : "c976ac4c-2bb4-48e5-8f85-2644c4ecf5a9"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/export/google&quot; -d &#39;{&quot;group&quot;:&quot;c976ac4c-2bb4-48e5-8f85-2644c4ecf5a9&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=GDZ6FpMTBtcVp-76AQ06Mn0N6yc&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;c976ac4c-2bb4-48e5-8f85-2644c4ecf5a9.ical&quot;
Content-Transfer-Encoding: binary
Content-Type: application/octet-stream
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;848f289d5dacd29b156f3b7c1e941b77&quot;
X-Request-Id: 43d8f69a-6c4d-4962-97ff-d459a893d6d0
X-Runtime: 0.007502
Content-Length: 297</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
BEGIN:VCALENDAR
VERSION:2.0
PRODID:icalendar-ruby
CALSCALE:GREGORIAN
METHOD:PUBLISH
BEGIN:VEVENT
DTSTAMP:20160830T095043Z
UID:a122635e-097d-4de8-91af-67e753a00832
DTSTART:20190915T174402
DTEND:20191015T174402
CLASS:PUBLIC
DESCRIPTION:
SUMMARY:Slot title 41
END:VEVENT
END:VCALENDAR

```
