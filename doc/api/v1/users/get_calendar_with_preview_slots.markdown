# Users API

## Get calendar with preview slots

### GET /v1/users/:id/calendars

### Parameters

Name : id
Description : ID of the user to get the calendars for.

### Request

#### Headers

<pre>Authorization: Token token=u72fkG4Z_kq1NaGX7ziKOfbT9Rw
Accept: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/207/calendars</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/users/207/calendars&quot; -X GET \
	-H &quot;Authorization: Token token=u72fkG4Z_kq1NaGX7ziKOfbT9Rw&quot; \
	-H &quot;Accept: application/json&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;527881b3876ac3cb36090844cbf5a6ea&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e7ff7384-1b73-44b4-a5b4-225e1bff3147
X-Runtime: 0.076642
Content-Length: 1983</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
