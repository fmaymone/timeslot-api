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

<pre>Host: example.org
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
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;8df38237940111715c2e56c0815f668e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 66ce62d3-504c-47bc-aa0b-7ac84f1a4916
X-Runtime: 0.025720
Vary: Origin
Content-Length: 35305</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "result" : [
    {
      "muid" : "f3af8fe9-407a-7230-6402-8475f35465bf",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-12-23T11:15:00",
      "endDate" : "2015-12-23T12:45:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/kassel/2015/12/23",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "CineStar",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 51.311479,
        "longitude" : 9.494213
      }
    },
    {
      "muid" : "5ebf11b7-4418-8afb-1349-9abd58a889c0",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-12-23T11:40:00",
      "endDate" : "2015-12-23T13:10:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/hannover/2015/12/23",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "CinemaxX Raschplatz",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 52.378436,
        "longitude" : 9.743857
      }
    },
    {
      "muid" : "c480cb3b-ea74-5abd-203f-ed32843b5f40",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-12-23T11:45:00",
      "endDate" : "2015-12-23T13:15:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/wildau/2015/12/23",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "CineStar",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 52.3157234191895,
        "longitude" : 13.6040649414062
      }
    },
    {
      "muid" : "46f2f4ac-db13-e0b4-256f-e9fe601a03c9",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-12-23T13:10:00",
      "endDate" : "2015-12-23T14:40:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/nuernberg/2015/12/23",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Cinecitta",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 49.45204,
        "longitude" : 11.083265
      }
    },
    {
      "muid" : "2b05e378-bcb4-3b01-1390-d13b5544e2d6",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-12-23T13:30:00",
      "endDate" : "2015-12-23T15:00:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/muelheim-an-der-ruhr/2015/12/23",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "CinemaxX",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 51.439473,
        "longitude" : 6.953685
      }
    },
    {
      "muid" : "7c3dcd99-dfc0-4d8a-2169-aef10cc16ff4",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-12-23T13:30:00",
      "endDate" : "2015-12-23T15:00:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/kassel/2015/12/23",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Cineplex Capitol",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 51.313909,
        "longitude" : 9.49104
      }
    },
    {
      "muid" : "c6344e47-9414-bfd6-f30a-872d8d864e11",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-12-23T13:45:00",
      "endDate" : "2015-12-23T15:15:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/berlin/2015/12/23",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "CinemaxX",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 52.508971,
        "longitude" : 13.373409
      }
    },
    {
      "muid" : "cb64dd3c-5d17-c1ae-0f80-4ad1404ea85d",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-12-23T13:45:00",
      "endDate" : "2015-12-23T15:15:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/bielefeld/2015/12/23",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "CinemaxX",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 52.029658,
        "longitude" : 8.530649
      }
    },
    {
      "muid" : "82cc5752-bc6d-0f34-96cb-c6037650c01f",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-12-23T13:45:00",
      "endDate" : "2015-12-23T15:15:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/kiel/2015/12/23",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "CinemaxX",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 54.314342,
        "longitude" : 10.132603
      }
    },
    {
      "muid" : "c1be1c8c-f41d-76ef-0b8e-9e100649a56e",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2015-12-23T13:50:00",
      "endDate" : "2015-12-23T15:20:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/bremen/2015/12/23",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "CineStar - Kristall-Palast",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 53.054092,
        "longitude" : 8.961569000000001
      }
    }
  ]
}
```
