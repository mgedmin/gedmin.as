<%inherit file="_templates/site.mako" />
<%def name="title()">Devintoji paskaita (2004-11-08)</%def>
<%def name="short_title()">9</%def>

<h2>Zope</h2>

<p><a href="http://www.zope.org">Zope</a> yra objektų publikavimo sistema
arba kažkas tarpinio tarp webinių taikomųjų programų serverio bei turinio
valdymo sistemos.</p>

<p>Pagrindiniai principai:</p>

<ul>
  <li>Duomenys saugomi objektinėje duomenų bazėje (ZODB), bet galima prieiti
  ir prie kitų duomenų šaltinių (failų sistemos, reliacinių duombazių ir
  t.t.).</li>
  <li>Sistemą galima keisti per webinį interfeisą (taip vadinamas TTW --
  Through The Web -- developmentas), o taip pat galima pasiekti per FTP arba
  WebDAV.</li>
  <li>Galima deleguoti priėjimą skirtingiems vartotojams su skirtingais
  priėjimo lygiais.</li>
  <li>Dinaminiai web puslapiai: ZPT (Zope Page Templates) arba DTML
  (vengtina).</li> 
  <li>Zope pagrindu yra sukurta keletas galutiniam vartotojui patogesnių
  turinio valdymo sistemų: <a href="http://www.plone.org">Plone</a> ("It Just
  Works"), <a href="http://www.infrae.com/products/silva">Silva</a>.</li>
</ul>

<p>Paskaitos esmė buvo TTW developmento demonstracija.</p>
