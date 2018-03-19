# Data API

## Import Slots from a file

### POST /v1/import/

returns 403 if the file includes invalid encoded chars

returns 404 if the group uuid was not found

returns 422 if parameters are invalid or missing

returns 500 if an error occurs during the file import

### Parameters

Name : file *- required -*
Description : The file which has to be imported.

Supported File Formats:.

1. iCalendar (*.ics).

2. Google Calendar (*.ics).

3. Microsoft Outlook (*.csv).

4. Timeslot (*.json)

Name : group
Description : Holds the uuid of the slot group to where the Slots should be imported.

If the parameter group is missing, a default slot group with the name &#39;Imports&#39; will used instead.

If the group uuid was not found, no Slot will be imported.

### Request

#### Headers

<pre>Content-Type: application/json
Accept: text/plain
Authorization: Token token=mBqjUBgeHwFPK903czLOPnnU13E
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/import/</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/import/&quot; -d &#39;{&quot;file&quot;:[&quot;BEGIN:VCALENDAR\r\n&quot;,&quot;VERSION:2.0\r\n&quot;,&quot;PRODID:icalendar-ruby\r\n&quot;,&quot;CALSCALE:GREGORIAN\r\n&quot;,&quot;METHOD:PUBLISH\r\n&quot;,&quot;BEGIN:VEVENT\r\n&quot;,&quot;DTSTAMP:20180319T154653Z\r\n&quot;,&quot;UID:273701f7-3fbe-44e1-a31c-d8a584882ee8\r\n&quot;,&quot;DTSTART:20190921T204402\r\n&quot;,&quot;DTEND:20191021T204402\r\n&quot;,&quot;CLASS:PUBLIC\r\n&quot;,&quot;DESCRIPTION:\r\n&quot;,&quot;SUMMARY:Slot title 20\r\n&quot;,&quot;END:VEVENT\r\n&quot;,&quot;BEGIN:VEVENT\r\n&quot;,&quot;DTSTAMP:20180319T154653Z\r\n&quot;,&quot;UID:e866754f-a1fa-42f2-99c2-16521e383107\r\n&quot;,&quot;DTSTART:20190922T214402\r\n&quot;,&quot;DTEND:20191022T214402\r\n&quot;,&quot;CLASS:PUBLIC\r\n&quot;,&quot;DESCRIPTION:\r\n&quot;,&quot;SUMMARY:Slot title 21\r\n&quot;,&quot;END:VEVENT\r\n&quot;,&quot;BEGIN:VEVENT\r\n&quot;,&quot;DTSTAMP:20180319T154653Z\r\n&quot;,&quot;UID:0c3d9c1f-954c-4c1a-935b-19ba270b2ecf\r\n&quot;,&quot;DTSTART:20190923T224402\r\n&quot;,&quot;DTEND:20191023T224402\r\n&quot;,&quot;CLASS:PUBLIC\r\n&quot;,&quot;DESCRIPTION:\r\n&quot;,&quot;SUMMARY:Slot title 22\r\n&quot;,&quot;END:VEVENT\r\n&quot;,&quot;BEGIN:VEVENT\r\n&quot;,&quot;DTSTAMP:20180319T154653Z\r\n&quot;,&quot;UID:e9b818b1-d065-49cb-a38f-fe85541ad152\r\n&quot;,&quot;DTSTART:20190924T234402\r\n&quot;,&quot;DTEND:20191024T234402\r\n&quot;,&quot;CLASS:PUBLIC\r\n&quot;,&quot;DESCRIPTION:\r\n&quot;,&quot;SUMMARY:Slot title 23\r\n&quot;,&quot;END:VEVENT\r\n&quot;,&quot;BEGIN:VEVENT\r\n&quot;,&quot;DTSTAMP:20180319T154653Z\r\n&quot;,&quot;UID:acf671f5-af52-4595-85d5-95ae1ba33916\r\n&quot;,&quot;DTSTART:20190925T004402\r\n&quot;,&quot;DTEND:20191025T004402\r\n&quot;,&quot;CLASS:PUBLIC\r\n&quot;,&quot;DESCRIPTION:\r\n&quot;,&quot;SUMMARY:Slot title 24\r\n&quot;,&quot;END:VEVENT\r\n&quot;,&quot;END:VCALENDAR\r\n&quot;]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=mBqjUBgeHwFPK903czLOPnnU13E&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 01bc8aba-8986-4de4-ad16-2418f73d24e5
X-Runtime: 0.246018
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

