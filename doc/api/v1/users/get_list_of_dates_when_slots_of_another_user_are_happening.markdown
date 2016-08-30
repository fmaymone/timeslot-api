# Users API

## Get list of dates when slots of another user are happening

### GET /v1/users/:id/dates

Returns all dates where a slot returned by GET /users/:id/slots is happening.

returns 404 if user doesn&#39;t exist

### Parameters

Name : id
Description : ID of the user to get the slot dates for.

### Request

#### Headers

<pre>Authorization: Token token=9u9K3KzzOmVKl50vNjEE3zhhWl0
Accept: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/177/dates</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/177/dates&quot; -X GET \
	-H &quot;Authorization: Token token=9u9K3KzzOmVKl50vNjEE3zhhWl0&quot; \
	-H &quot;Accept: application/json&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;05592ceeda97f88597ea941e05030e73&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ceecf112-3cad-4048-9de8-9a5eeb9dd5e3
X-Runtime: 0.024031
Content-Length: 64</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "result" : [
    "2016-02-02",
    "2017-03-03",
    "2016-02-03",
    "2016-02-04"
  ]
}
```
