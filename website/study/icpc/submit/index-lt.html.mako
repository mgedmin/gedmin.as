<%inherit file="_templates/site.mako" />
<%def name="title()">Siųsti sprendimą</%def>
<%def name="short_title()">Siųsti sprendimą</%def>

<h2>Siųsti sprendimą</h2>

<tal:define define="errors here/submit">

<div tal:condition="errors" tal:content="errors" class="errors">
</div>

<form action="." method="post" enctype="multipart/form-data" tal:attributes="href request/URL">

<div>
<label for="from">Kas</label>
<select id="from" name="from">
  <option value="">(nurodykite savo vardą)</option>
  <option tal:repeat="student here/listStudents" tal:attributes="value student/login;
                          selected python:
                            (request.get('from') == student['login'])
                              and 'selected' or None" tal:content="student/name"></option>
</select>
</div>

<div>
<label for="problem">Užduotis</label>
<select id="problem" name="problem">
  <option value="">(pasirinkite užduotį)</option>
  <option tal:repeat="name here/listProblems" tal:attributes="value name;
                          selected python:
                            (request.get('problem') == name)
                              and 'selected' or None" tal:content="name"></option>
</select>
</div>

<div>
<label for="lang">Kalba</label>
<select id="lang" name="language">
  <option value="">(pasirinkite kalbą)</option>
  <option tal:repeat="lang here/listLanguages" tal:attributes="value lang/ext;
                          selected python:
                            (request.get('language') == lang['ext'])
                              and 'selected' or None" tal:content="lang/name"></option>
</select>
<tal:comment condition="nothing">
<tal:block repeat="lang here/listLanguages">
  <label class="radio">
    <input type="radio" name="language" tal:define="first repeat/lang/start" tal:attributes="value lang/ext;
                           checked python:
                             (request.get('language') == lang['ext'])
                               and 'checked' or None;
                           id python:first and 'lang' or None" />
    <span tal:replace="lang/name" />
  </label>
</tal:block>
</tal:comment>
</div>

<div>
<label class="checkbox">
  <input type="checkbox" checked="checked" id="cc" name="cc" />
  noriu gauti laiško su sprendimu kopiją
</label>
</div>

<div>
<label for="comments">Komentarai</label>
<textarea id="comments" name="comments" cols="80" rows="10" tal:content="request/comments | nothing">
</textarea>
</div>

<div>
<label for="file">Sprendimas</label>
<input type="file" id="file" name="file" size="40" tal:attributes="value request/file/filename | nothing" />
</div>

<div>
<input type="submit" name="submit" value="Siųsti" />
</div>

<div>
<label for="solution" class="wide">Galima sprendimo tekstą įpastinti čia</label>
<textarea id="solution" name="solution" cols="80" rows="20" tal:content="request/solution | nothing">
</textarea>
</div>
<div>
<input type="submit" name="submit" value="Siųsti" />
</div>

</form>

</tal:define>
