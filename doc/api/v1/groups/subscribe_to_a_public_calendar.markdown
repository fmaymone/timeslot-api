# Groups API

## Subscribe to a public calendar

### POST /v1/calendars/:slotgroup_uuid/subscribe

Adds the current user to the slotgroup/calendar. Calendar must be public.

returns 201 if invite successfully created

returns 404 if group UUID is invalid

### Parameters

Name : slotgroup_uuid *- required -*
Description : ID of the group

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=DNfO6PsmlavnpuWaEaxxHUOERYE
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/calendars/b13c5f40-b348-431d-92e6-116c77b65c33/subscribe</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/calendars/b13c5f40-b348-431d-92e6-116c77b65c33/subscribe&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=DNfO6PsmlavnpuWaEaxxHUOERYE&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;5e9fa0abfec9703671eb9c2f6c31395b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 956f4ad2-a964-4d02-9e2e-ab3c1e48e1b4
X-Runtime: 0.027444
Vary: Origin
Content-Length: 154</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : "b13c5f40-b348-431d-92e6-116c77b65c33",
  "size" : 2,
  "related" : [
    {
      "id" : 69,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "id" : 68,
      "state" : "active",
      "deletedAt" : null
    }
  ]
}
```
