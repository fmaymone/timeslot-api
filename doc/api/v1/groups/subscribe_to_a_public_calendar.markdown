# Groups API

## Subscribe to a public calendar

### POST /v1/calendars/:slotgroup_uuid/subscribe

Adds the given current user to the slotgroup/calendar. Calendar must be public.

returns 201 if invite successfully created

returns 404 if group UUID is invalid

### Parameters

Name : slotgroup_uuid *- required -*
Description : ID of the group

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=2tztd9rigT5U8geuhMXXNS0jWLk
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/calendars/be256b24-e729-4981-b89f-8e590c7f14fb/subscribe</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/calendars/be256b24-e729-4981-b89f-8e590c7f14fb/subscribe&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=2tztd9rigT5U8geuhMXXNS0jWLk&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;3b833296dcaf24a9efef2f86b8e6e1b4&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 5a27211a-03d9-4107-bcfb-bbe60319c375
X-Runtime: 0.045714
Vary: Origin
Content-Length: 154</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : "be256b24-e729-4981-b89f-8e590c7f14fb",
  "size" : 2,
  "related" : [
    {
      "id" : 59,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "id" : 58,
      "state" : "active",
      "deletedAt" : null
    }
  ]
}
```
