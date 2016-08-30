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
Authorization: Token token=qnVjJOm8B5R50u_MrZVytgE6XwE
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/calendars/a30968fb-a309-401f-a60a-2574cca6b859/subscribe</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/calendars/a30968fb-a309-401f-a60a-2574cca6b859/subscribe&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=qnVjJOm8B5R50u_MrZVytgE6XwE&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;57ace88577fc77be51675fcbc99cf45f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: bea4eed9-2589-42f8-bc6a-0f1be83a50ea
X-Runtime: 0.067654
Content-Length: 156</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : "a30968fb-a309-401f-a60a-2574cca6b859",
  "size" : 2,
  "related" : [
    {
      "id" : 390,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "id" : 391,
      "state" : "active",
      "deletedAt" : null
    }
  ]
}
```
