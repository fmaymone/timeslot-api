# Data API

## Export created Slots from the current user related to a given Group to the iCalendar format

### POST /v1/export/ical

### Parameters

Name : group
Description : Holds the uuid of the slot group which should be exported.
If the parameter group is missing, all Slot will be exported.
If the group uuid was not found, no Slot will be exported.

### Request

#### Headers

<pre>Content-Type: application/json
Accept: text/plain
Authorization: Token token=pyxyOMZvkGDxhaGNEGtmQQMEiMg
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/ical</pre>

#### Body
```javascript
{
  "group" : "1650bf92-2388-44a2-8c99-ddbe6415b686"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/export/ical&quot; -d &#39;{&quot;group&quot;:&quot;1650bf92-2388-44a2-8c99-ddbe6415b686&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=pyxyOMZvkGDxhaGNEGtmQQMEiMg&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;1650bf92-2388-44a2-8c99-ddbe6415b686.ical&quot;
Content-Transfer-Encoding: binary
Content-Type: application/octet-stream
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;354701beba1d9f17ed5c71f96bd3581a&quot;
X-Request-Id: 4e991ac9-5360-41e9-8cee-baa8b53971ba
X-Runtime: 0.028567
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
DTSTAMP:20160501T225405Z
UID:5d7d3502-47ca-4c34-b6d1-0dd31d9a99ea
DTSTART:20190927T024402
DTEND:20191027T024402
CLASS:PUBLIC
DESCRIPTION:
SUMMARY:Slot title 26
END:VEVENT
END:VCALENDAR

```
