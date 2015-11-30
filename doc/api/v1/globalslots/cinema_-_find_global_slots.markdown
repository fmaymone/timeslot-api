# GlobalSlots API

## Cinema - Find global slots

### GET /v1/globalslots/search

Forwards a search request to the Elastic Search Service for global slots from the data team.

returns 422 if parameters invalid

### Parameters

Name : category *- required -*
Description : Basic slot category to search in. Valid categories: [cinema, football] 

Name : q *- required -*
Description : String to search global slots for

Name : moment
Description : find results after this datetime, default: Time.now

Name : limit
Description : maximum number of results, default: 20

### Request

#### Headers

<pre>Accept: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/globalslots/search?category=cinema&amp;q=James&amp;moment=2015-11-29T12%3A43%3A28.907Z&amp;limit=10</pre>

#### Query Parameters

<pre>category: cinema
q: James
moment: 2015-11-29T12:43:28.907Z
limit: 10</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/globalslots/search?category=cinema&amp;q=James&amp;moment=2015-11-29T12%3A43%3A28.907Z&amp;limit=10&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;b1a82ae988070d2db454c8bd0faf818e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7dd01a43-d03a-48b8-9598-cd417d20f71a
X-Runtime: 0.051815
Vary: Origin
Content-Length: 36591</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "results" : [
    {
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-11-29T13:45:00",
      "endDate" : "2015-11-29T15:15:00",
      "location" : {
        "name" : "Gloria",
        "locality" : "stuttgart",
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 48.780124,
        "longitude" : 9.179432
      },
      "creator" : {
        "id" : 14,
        "username" : "moviepilot.de",
        "createdAt" : "2015-11-30T00:23:30.439Z",
        "updatedAt" : "2015-11-30T00:23:30.439Z",
        "deletedAt" : null,
        "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
      },
      "notes" : [
        {
          "title" : "crawler ID",
          "content" : 9683410
        },
        {
          "title" : "description",
          "content" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)"
        },
        {
          "title" : "tags",
          "content" : "cinema,movies"
        },
        {
          "title" : "url",
          "content" : "http://www.moviepilot.de/kino/kinoprogramm/stuttgart/2015/11/29"
        },
        {
          "title" : "cuid",
          "content" : null
        },
        {
          "title" : "duid",
          "content" : null
        }
      ],
      "media" : {
        "publicId" : null,
        "mediaType" : "image"
      }
    },
    {
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-11-29T13:30:00",
      "endDate" : "2015-11-29T15:00:00",
      "location" : {
        "name" : "Cine City",
        "locality" : "verden",
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 52.922205,
        "longitude" : 9.233549
      },
      "creator" : {
        "id" : 14,
        "username" : "moviepilot.de",
        "createdAt" : "2015-11-30T00:23:30.439Z",
        "updatedAt" : "2015-11-30T00:23:30.439Z",
        "deletedAt" : null,
        "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
      },
      "notes" : [
        {
          "title" : "crawler ID",
          "content" : 9689561
        },
        {
          "title" : "description",
          "content" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)"
        },
        {
          "title" : "tags",
          "content" : "cinema,movies"
        },
        {
          "title" : "url",
          "content" : "http://www.moviepilot.de/kino/kinoprogramm/verden/2015/11/29"
        },
        {
          "title" : "cuid",
          "content" : null
        },
        {
          "title" : "duid",
          "content" : null
        }
      ],
      "media" : {
        "publicId" : null,
        "mediaType" : "image"
      }
    },
    {
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-11-29T13:30:00",
      "endDate" : "2015-11-29T15:00:00",
      "location" : {
        "name" : "Luxor - Filmpalast",
        "locality" : "walldorf",
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 49.292727,
        "longitude" : 8.664007
      },
      "creator" : {
        "id" : 14,
        "username" : "moviepilot.de",
        "createdAt" : "2015-11-30T00:23:30.439Z",
        "updatedAt" : "2015-11-30T00:23:30.439Z",
        "deletedAt" : null,
        "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
      },
      "notes" : [
        {
          "title" : "crawler ID",
          "content" : 9688462
        },
        {
          "title" : "description",
          "content" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)"
        },
        {
          "title" : "tags",
          "content" : "cinema,movies"
        },
        {
          "title" : "url",
          "content" : "http://www.moviepilot.de/kino/kinoprogramm/walldorf/2015/11/29"
        },
        {
          "title" : "cuid",
          "content" : null
        },
        {
          "title" : "duid",
          "content" : null
        }
      ],
      "media" : {
        "publicId" : null,
        "mediaType" : "image"
      }
    },
    {
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-11-29T13:45:00",
      "endDate" : "2015-11-29T15:15:00",
      "location" : {
        "name" : "Traumpalast",
        "locality" : "schorndorf",
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 48.804854,
        "longitude" : 9.521658
      },
      "creator" : {
        "id" : 14,
        "username" : "moviepilot.de",
        "createdAt" : "2015-11-30T00:23:30.439Z",
        "updatedAt" : "2015-11-30T00:23:30.439Z",
        "deletedAt" : null,
        "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
      },
      "notes" : [
        {
          "title" : "crawler ID",
          "content" : 9676623
        },
        {
          "title" : "description",
          "content" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)"
        },
        {
          "title" : "tags",
          "content" : "cinema,movies"
        },
        {
          "title" : "url",
          "content" : "http://www.moviepilot.de/kino/kinoprogramm/schorndorf/2015/11/29"
        },
        {
          "title" : "cuid",
          "content" : null
        },
        {
          "title" : "duid",
          "content" : null
        }
      ],
      "media" : {
        "publicId" : null,
        "mediaType" : "image"
      }
    },
    {
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-11-29T13:00:00",
      "endDate" : "2015-11-29T14:30:00",
      "location" : {
        "name" : "Filmpassage",
        "locality" : "osnabrueck",
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 52.268273,
        "longitude" : 8.052443
      },
      "creator" : {
        "id" : 14,
        "username" : "moviepilot.de",
        "createdAt" : "2015-11-30T00:23:30.439Z",
        "updatedAt" : "2015-11-30T00:23:30.439Z",
        "deletedAt" : null,
        "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
      },
      "notes" : [
        {
          "title" : "crawler ID",
          "content" : 9673142
        },
        {
          "title" : "description",
          "content" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)"
        },
        {
          "title" : "tags",
          "content" : "cinema,movies"
        },
        {
          "title" : "url",
          "content" : "http://www.moviepilot.de/kino/kinoprogramm/osnabrueck/2015/11/29"
        },
        {
          "title" : "cuid",
          "content" : null
        },
        {
          "title" : "duid",
          "content" : null
        }
      ],
      "media" : {
        "publicId" : null,
        "mediaType" : "image"
      }
    },
    {
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-11-29T13:45:00",
      "endDate" : "2015-11-29T15:15:00",
      "location" : {
        "name" : "Admiral Filmpalast",
        "locality" : "nuernberg",
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 49.451608,
        "longitude" : 11.07802
      },
      "creator" : {
        "id" : 14,
        "username" : "moviepilot.de",
        "createdAt" : "2015-11-30T00:23:30.439Z",
        "updatedAt" : "2015-11-30T00:23:30.439Z",
        "deletedAt" : null,
        "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
      },
      "notes" : [
        {
          "title" : "crawler ID",
          "content" : 9672849
        },
        {
          "title" : "description",
          "content" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)"
        },
        {
          "title" : "tags",
          "content" : "cinema,movies"
        },
        {
          "title" : "url",
          "content" : "http://www.moviepilot.de/kino/kinoprogramm/nuernberg/2015/11/29"
        },
        {
          "title" : "cuid",
          "content" : null
        },
        {
          "title" : "duid",
          "content" : null
        }
      ],
      "media" : {
        "publicId" : null,
        "mediaType" : "image"
      }
    },
    {
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-11-29T12:45:00",
      "endDate" : "2015-11-29T14:15:00",
      "location" : {
        "name" : "Admiral Filmpalast",
        "locality" : "nuernberg",
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 49.451608,
        "longitude" : 11.07802
      },
      "creator" : {
        "id" : 14,
        "username" : "moviepilot.de",
        "createdAt" : "2015-11-30T00:23:30.439Z",
        "updatedAt" : "2015-11-30T00:23:30.439Z",
        "deletedAt" : null,
        "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
      },
      "notes" : [
        {
          "title" : "crawler ID",
          "content" : 9672840
        },
        {
          "title" : "description",
          "content" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)"
        },
        {
          "title" : "tags",
          "content" : "cinema,movies"
        },
        {
          "title" : "url",
          "content" : "http://www.moviepilot.de/kino/kinoprogramm/nuernberg/2015/11/29"
        },
        {
          "title" : "cuid",
          "content" : null
        },
        {
          "title" : "duid",
          "content" : null
        }
      ],
      "media" : {
        "publicId" : null,
        "mediaType" : "image"
      }
    },
    {
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-11-29T13:30:00",
      "endDate" : "2015-11-29T15:00:00",
      "location" : {
        "name" : "Casablanca-Programmkino",
        "locality" : "oldenburg",
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 53.147377,
        "longitude" : 8.212119
      },
      "creator" : {
        "id" : 14,
        "username" : "moviepilot.de",
        "createdAt" : "2015-11-30T00:23:30.439Z",
        "updatedAt" : "2015-11-30T00:23:30.439Z",
        "deletedAt" : null,
        "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
      },
      "notes" : [
        {
          "title" : "crawler ID",
          "content" : 9672830
        },
        {
          "title" : "description",
          "content" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)"
        },
        {
          "title" : "tags",
          "content" : "cinema,movies"
        },
        {
          "title" : "url",
          "content" : "http://www.moviepilot.de/kino/kinoprogramm/oldenburg/2015/11/29"
        },
        {
          "title" : "cuid",
          "content" : null
        },
        {
          "title" : "duid",
          "content" : null
        }
      ],
      "media" : {
        "publicId" : null,
        "mediaType" : "image"
      }
    },
    {
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-11-29T12:45:00",
      "endDate" : "2015-11-29T14:15:00",
      "location" : {
        "name" : "Traumpalast",
        "locality" : "nuertingen",
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 48.62688,
        "longitude" : 9.340869
      },
      "creator" : {
        "id" : 14,
        "username" : "moviepilot.de",
        "createdAt" : "2015-11-30T00:23:30.439Z",
        "updatedAt" : "2015-11-30T00:23:30.439Z",
        "deletedAt" : null,
        "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
      },
      "notes" : [
        {
          "title" : "crawler ID",
          "content" : 9672285
        },
        {
          "title" : "description",
          "content" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)"
        },
        {
          "title" : "tags",
          "content" : "cinema,movies"
        },
        {
          "title" : "url",
          "content" : "http://www.moviepilot.de/kino/kinoprogramm/nuertingen/2015/11/29"
        },
        {
          "title" : "cuid",
          "content" : null
        },
        {
          "title" : "duid",
          "content" : null
        }
      ],
      "media" : {
        "publicId" : null,
        "mediaType" : "image"
      }
    },
    {
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-11-29T13:00:00",
      "endDate" : "2015-11-29T14:30:00",
      "location" : {
        "name" : "Cineplex",
        "locality" : "muenster",
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 51.950452,
        "longitude" : 7.636582
      },
      "creator" : {
        "id" : 14,
        "username" : "moviepilot.de",
        "createdAt" : "2015-11-30T00:23:30.439Z",
        "updatedAt" : "2015-11-30T00:23:30.439Z",
        "deletedAt" : null,
        "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
      },
      "notes" : [
        {
          "title" : "crawler ID",
          "content" : 9670788
        },
        {
          "title" : "description",
          "content" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)"
        },
        {
          "title" : "tags",
          "content" : "cinema,movies"
        },
        {
          "title" : "url",
          "content" : "http://www.moviepilot.de/kino/kinoprogramm/muenster/2015/11/29"
        },
        {
          "title" : "cuid",
          "content" : null
        },
        {
          "title" : "duid",
          "content" : null
        }
      ],
      "media" : {
        "publicId" : null,
        "mediaType" : "image"
      }
    }
  ]
}
```
