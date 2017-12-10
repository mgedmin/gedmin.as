# -*- coding: utf-8 -*-

######################################################################
# This is your site's Blogofile configuration file.
# www.Blogofile.com
#
# This file doesn't list every possible setting, it relies on defaults
# set in the core blogofile _config.py. To see where the default
# configuration is on your system run 'blogofile info'
#
######################################################################

import os
import csv
import time
import logging
import datetime

from mako.template import Template
from blogofile.cache import Cache


log = logging.getLogger('blogofile.config')


def expose(name=None):
    """Expose a function to Mako templates."""
    def wrapper(fn):
        site.template_vars[name or fn.__name__] = fn
        return fn
    return wrapper


######################################################################
# Basic Settings
#  (almost all sites will want to configure these settings)
######################################################################
## site_url -- Your site's full URL
# Your "site" is the same thing as your _site directory.
#  If you're hosting a blogofile powered site as a subdirectory of a larger
#  non-blogofile site, then you would set the site_url to the full URL
#  including that subdirectory: "http://www.yoursite.com/path/to/blogofile-dir"
site.url = "https://gedmin.as"


#
# Homebrew multilingual solution
#

site.default_lang = 'en'

site.languages = [
    ('lt', 'Lithuanian'),
    ('en', 'English'),
]

site.translations = {
    'Last updated:':
        dict(lt='Paskutiniai pakeitimai:'),
    'Site Map':
        dict(lt='Turinys'),
}


@expose('_')
def translate(msg):
    translations = site.translations
    lang = bf.template_context.lang
    return translations.get(msg, {}).get(lang, msg)


@expose()
def get_cur_lang():
    if 'lang' in bf.template_context:
        return bf.template_context.lang
    for code, title in site.languages:
        suffix = '-%s.html.mako' % code
        if bf.template_context.template_name.endswith(suffix):
            break
    else:
        code = site.default_lang
    bf.template_context.lang = code
    return code


@expose()
def include(filename, charset='UTF-8'):
    cur_template = bf.template_context.template_name
    filename = os.path.join(os.path.dirname(cur_template), filename)
    return open(filename).read().decode(charset)


@expose()
def get_body(lang):
    cur_template = bf.template_context.template_name
    new_template = os.path.join(os.path.dirname(cur_template),
                                'index-%s.html.mako' % lang)
    template = get_template(new_template)
    return template.get_def('body').render(bf=bf,
                    **bf.config.site.template_vars).decode('UTF-8')


def post_build():
    output_dir = bf.writer.output_dir
    for dirpath, dirnames, filenames in os.walk(output_dir):
        filename = os.path.join(dirpath, 'index.html')
        if not os.path.exists(filename):
            log.info('Creating symlink %s' % filename)
            os.symlink('index-%s.html' % site.default_lang, filename)


#
# Homebrew navigation solution
#

site.map = '''
    /
        about/

        pyconlt2012/
        pyconlt2014/

        study/
          * python/
              * slides/
              * 2005/
                  * slides/
              * 2004/
                  * lecture1
                  * lecture2
                  * lecture3
                  * lecture4
                  * lecture5
                  * lecture6
                  * lecture7
                  * lecture8
                  * lecture9
          * icpc/
              * 2003a/
              * 2003b/
              * 2004a/
              * 2004b/
              * atranka2005/
              * atranka2006/
              * algorithms/
              * analysis/
              * dynamic-programming/
          * cna/
              * advice/
              * 2005/
          * inf/
          * inf98/
                autumn2002/
                spring2003/
                ate/
                disma/
                disma2/
                mpm/
                nn/
                odb/
                ood/
                physics/
                pkpm/
                itvv/
        denmark/

        palm/

        mutt/
        icewm/
        debs/
        links/
        debian/

        lit-con/
        docs/
        ltz/
        kernel/
        tlint/
        ltt/
        fonts/
        misc/

        medit/
        lit/
        keyutils/
        demo/
        pascal/
        disasm/

        calc/

        news/

        sitemap/
'''
site.excluded_from_site_map = [
    # incomplete pages not exposed to the public; don't warn
    'av',
    'books',
    'tmp',
    # hidden pages
    'study/python/students',
    'study/python/students/by_group',
    'study/python/2005/students',
    'study/icpc/seminaras',
    'study/icpc/submit',
    # no index-{lt,en}.html, we use a real index.html there
    'study/icpc/atranka2005/nuotraukos',
    'study/cna/results',
    'study/cna/2005/results',
]



def get_trail_templates(filename, lang):
    filename = os.path.abspath(filename)
    result = [filename]
    path = os.path.dirname(filename)
    while True:
        path = os.path.dirname(path)
        filename = os.path.join(path, 'index-%s.html.mako' % lang)
        if not os.path.exists(filename):
            break
        result.append(filename)
    result.reverse()
    return result


def get_template(filename):
    with open(filename) as f:
        return Template(f.read().decode("utf-8"),
                        output_encoding="utf-8",
                        lookup=bf.writer.template_lookup)


def get_template_info(filename):
    cache = bf.setdefault('my_template_info_cache', {})
    if filename not in cache:
        template = get_template(filename)
        title = template.get_def('title').render().decode('UTF-8')
        short_title = template.get_def('short_title').render().decode('UTF-8')
        if not short_title:
            short_title = title
        cache[filename] = (title, short_title)
    return cache[filename]


def get_trail_for(filename, lang):
    templates = get_trail_templates(filename, lang)
    root = os.path.dirname(templates[0])
    result = []
    for filename in templates:
        subpath = os.path.dirname(filename)[len(root):]
        title, short_title = get_template_info(filename)
        result.append((subpath, short_title, title))
    return result


@expose()
def get_trail():
    return get_trail_for(bf.template_context.template_name, get_cur_lang())


class SiteMapNode(object):

    def __init__(self, indent, name, marked=False):
        self.indent = indent
        self.name = name
        self.children = []
        self.parent = None
        self.marked = marked

    def getPath(self, *extra_bits):
        bits = []
        node = self
        while node is not None:
            bits.append(node.name.strip('/'))
            node = node.parent
        bits.reverse()
        bits.extend(extra_bits)
        return bf.util.path_join(bits)

    def getURL(self, lang):
        return self.getPath('index-%s.html' % lang)

    def getFilename(self, lang):
        return self.getPath('index-%s.html.mako' % lang)

    def getTitle(self, lang):
        filename = self.getFilename(lang)
        try:
            title, short_title = get_template_info(filename)
        except IOError:
            log.error('%s does not exist' % filename)
            return '(missing template %s)' % filename
        return title

    def getShortTitle(self, lang):
        filename = self.getFilename(lang)
        try:
            title, short_title = get_template_info(filename)
        except IOError:
            log.error('%s does not exist' % filename)
            return '(missing template %s)' % filename
        return short_title

    @property
    def subpath(self):
        return '/' + self.getPath()

    @property
    def url(self):
        return self.getURL(get_cur_lang())

    @property
    def filename(self):
        return self.getFilename(get_cur_lang())

    @property
    def title(self):
        return self.getTitle(get_cur_lang())

    @property
    def short_title(self):
        return self.getShortTitle(get_cur_lang())

    def traverse(self):
        yield self
        for child in self.children:
            if child is not None:
                for node in child.traverse():
                    yield node

    def find(self, path):
        if path.startswith('./'):
            path = path[2:]
        if '/' not in path:
            return self
        head, tail = path.split('/', 1)
        for child in self.children:
            if child and child.name.strip('/') == head:
                return child.find(tail)


def parse_site_map(site_map):
    root = cur = None
    for line in site_map.splitlines():
        name = line.strip('* ')
        if not name:
            if (cur and cur.parent and cur.parent.children
                and cur.parent.children[-1] is not None):
                cur.parent.children.append(None)
            continue
        indent = len(line) - len(line.lstrip('* ')) # haack
        node = SiteMapNode(indent, name, marked=('*' in line))
        if cur is None:
            root = cur = node
        else:
            while indent <= cur.indent:
                cur = cur.parent
            node.parent = cur
            cur.children.append(node)
        cur = node
    return root


@expose()
def get_site_map_root():
    if 'site_map_root' not in bf.template_context:
        bf.template_context.site_map_root = parse_site_map(site.map)
    return bf.template_context.site_map_root


def pre_build():
    check_site_map_completeness()


def check_site_map_completeness():
    root = get_site_map_root()
    languages = [code for code, title in site.languages]
    in_site_map = set(n.getFilename(lang)
                        for n in root.traverse()
                        for lang in languages)
    existing = set()
    for dirpath, dirnames, filenames in os.walk('.'):
        for lang in languages:
            filename = 'index-%s.html.mako' % lang
            if filename in filenames and dirpath[2:] not in site.excluded_from_site_map:
                existing.add(os.path.join(dirpath, filename)[2:])
    not_in_site_map = existing - in_site_map
    for name in sorted(not_in_site_map):
        log.warning("Site-map doesn't include %s" % name)
    missing = in_site_map - existing
    for name in sorted(missing):
        log.warning("Site-map refers to a non-existing %s" % name)


@expose()
def get_subpages():
    root = get_site_map_root()
    node = root.find(bf.template_context.template_name)
    if not node:
        return []
    result = []
    for child in node.children:
        if child and child.marked:
            subpath = child.subpath
            short_title = child.short_title
            title = child.title
            result.append((subpath, short_title, title))
    return result


#
# Automatic modification time
#

@expose()
def get_mtime_str(format='%Y-%m-%d', source=None):
    filename = bf.template_context.template_name
    if source:
        filename = os.path.join(os.path.dirname(filename), source)
    try:
        mtime = os.stat(filename).st_mtime
    except OSError:
        mtime = time.time()
    return time.strftime(format, time.localtime(mtime))


#
# Ad-hoc CSV parsing/logic for Computer Network practice
#


@expose()
def cna_parse_students(gr, pogr=None, source='data${gr}gr.csv'):
    cur_template = bf.template_context.template_name
    csv_file = os.path.join(os.path.dirname(cur_template),
                            source.replace('${gr}', gr))
    result = []
    for cells in list(csv.reader(open(csv_file)))[1:]:
        # 0: eil nr, 1: stud paz, 2: vardas, 3: username, 4: uzduotis, 5: pogrupis, 6: 1uzd, 7: data, 8: pastabos, 9: 2uzd, 10:, 11:, 12: 3uzd, ...
        cells = [s.strip() for s in cells]
        while len(cells) <= 12:
            cells.append('')
        if pogr and str(pogr) != cells[5]:
            continue
        uzd1 = cells[6] and '+' or ''
        uzd2 = cells[9] and '+' or ''
        uzd3 = cells[12] and '+' or ''
        result.append(Cache(
            name=cells[2].strip().decode('UTF-8'),
            task=cells[4].strip().decode('UTF-8'),
            uzd=[uzd1, uzd2, uzd3],
        ))
    return result


@expose()
def cna_tasks(gr=None, pogr=None, source='taskdata'):
    taken = {}
    exacttaken = {}
    if gr:
        for row in cna_parse_students(gr=gr, pogr=pogr):
            task = row['task']
            exacttaken[task] = exacttaken.get(task, 0) + 1
            if task: task = task.split()[0]
            taken[task] = taken.get(task, 0) + 1

    cur_template = bf.template_context.template_name
    task_file = os.path.join(os.path.dirname(cur_template), source)
    data = open(task_file).read()

    rows = data.strip().splitlines()[1:]
    result = []
    for row in rows:
        cells = row.split(None, 1)
        task = cells[0]
        title = cells[1]
        shorttitle = title
        if len(shorttitle) > 30:
            shorttitle = ' '.join(title.split()[:5]) + "..."
        en = exacttaken.get(task, 0)
        n = taken.get(task, 0)
        if en > 1: cls = 'conflict'
        elif n: cls = 'taken'
        else: cls = ''
        result.append(Cache(
            task=task.decode('UTF-8'),
            title=title.decode('UTF-8'),
            shorttitle=shorttitle.decode('UTF-8'),
            class_=cls,
        ))
    return result


@expose()
def cna_results(gr=None, pogr=None, deadlines=(), source='../data${gr}gr.csv',
                holiday_week=None, date_prefix_sanity_check='2005-0'):
    for deadline in deadlines:
        assert deadline.startswith(date_prefix_sanity_check)

    taskmap = {}
    for row in cna_tasks(source='../taskdata'):
        taskmap[row['task']] = row['shorttitle']

    def parse_score(score):
        """Pvz., '1.5+0.2-0.3' => [1.5, 0.2, -0.3]"""
        score = score.replace(' ', '')
        score = score.replace('+', ' +')
        score = score.replace('-', ' -')
        return map(float, score.split())

    def week_of(date):
        week = datetime.datetime.strptime(date, '%Y-%m-%d').isocalendar()[1]
        if holiday_week is not None:
            assert week != holiday_week
            if week < holiday_week:
                week += 1
        return week

    def penalty(date, deadline):
        w_of_d = week_of(date)
        diff = week_of(deadline) - w_of_d
        if diff > 3:
            diff = 3
        return diff * 0.1

    cur_template = bf.template_context.template_name
    csv_file = os.path.join(os.path.dirname(cur_template),
                            source.replace('${gr}', gr))
    result = []
    for cells in list(csv.reader(open(csv_file)))[1:]:
        # 0: eil nr, 1: stud paz, 2: vardas, 3: username, 4: uzduotis, 5: pogrupis, 6: 1uzd, 7: data, 8: pastabos, 9: 2uzd, 10:, 11:, 12: 3uzd, ...
        cells = [s.strip() for s in cells]
        while len(cells) <= 15:
            cells.append('')
        if pogr and str(pogr) != cells[5]:
            continue
        uzd = []
        total = total_no_delay = 0
        left = {1.5: 2, 1: 1}
        kurios = {}
        for n in range(3):
            score = cells[6+3*n].strip()
            parts = parse_score(score)
            total += sum(parts)
            total_no_delay += sum(parts)
            if len(parts) > 1 and parts[1] < 0:
                total_no_delay -= parts[1]
            date = cells[7+3*n].strip()
            comments = cells[8+3*n].strip()
            plus = score and '+' or ''
            uncertainity = False

            if ('C++/Java' in comments or 'C/Java' in comments
                or 'Java/C++' in comments or 'C++ su Java' in comments):
                if 'C++/Java' in kurios:
                    comments = "kartojasi!!!\n" + comments
                else:
                    kurios['C++/Java'] = 1
            elif 'C' in comments:
                if 'C' in kurios:
                    comments = "kartojasi!!!\n" + comments
                else:
                    kurios['C'] = 1
            elif 'Java' in comments:
                if 'Java' in kurios:
                    comments = "kartojasi!!!\n" + comments
                else:
                    kurios['Java'] = 1

            if date and not date.startswith(date_prefix_sanity_check):
                uncertainity = True
                comments = "data!!!\n" + comments
            if date and parts:
                pen = penalty(date, deadlines[n])
                if pen == 0:
                    parts.insert(1, 0.0)
                elif parts:
                    if len(parts) < 2:
                        parts.append(0.0)
                    if abs(parts[1] - pen) > 0.001:
                        uncertainity = True
                        if pen < 0:
                            comments = "(vėlavo %s)!!!\n" % pen + comments
                        else:
                            comments = "(skubėjo %s)!!!\n" % pen + comments

            if parts:
                if left.get(parts[0], 0) < 1:
                    comments = "!!!\n" + comments
                else:
                    left[parts[0]] = left[parts[0]] - 1

            if 'nežinau už ką' in comments:
                uncertainity = True

            score = ''.join(['%+.1f' % x for x in parts])
            if score.startswith('+'): score = score[1:]
            score = score.replace('-', u'−') # hyphen -> U+2212 MINUS SIGN
            uzd.append(Cache(
                plus=plus,
                date=date,
                score=score,
                comments=comments.decode('UTF-8'),
                uncertainity=uncertainity,
            ))

        task = cells[4].strip().decode('UTF-8')
        taskhint = taskmap.get(task, "")
        result.append(Cache(
            name=cells[2].strip().decode('UTF-8'),
            taskhint=taskhint,
            task=task,
            uzd=uzd,
            total=total,
            total_no_delay=total_no_delay,
            studnr=cells[1].strip().decode('UTF-8'),
        ))
    return result


#
# Ad-hoc CSV parsing/logic for Python practice
#


def py_tasks(source='tasks.txt', strict=False):
    cur_template = bf.template_context.template_name
    data_file = os.path.join(os.path.dirname(cur_template), source)

    errors = []

    people = {}
    for line in open(data_file).read().splitlines():
        line = line.decode('UTF-8')
        if line.startswith('#'):
            continue
        if ':' not in line:
            continue
        name, what = line.split(':', 1)
        name = fullinfo = name.strip()
        if '(' in name:
            name = name.split('(', 1)[0].strip()
        persondata = people.setdefault(name, Cache(
            name=name, fullinfo=fullinfo))
        what = what.strip()
        if '[' not in what:
            if strict:
                errors.append('no "[" in line %s' % line)
            continue
        description, status = what.split('[', 1)
        description = description.strip()
        taskandstatus = status[:-1].strip()
        taskid = 'unknown'
        status = taskandstatus
        for tid in ['1', '2', '3', 'projektukas', 'testukas']:
            if taskandstatus.startswith(tid):
                taskid = tid
                status = taskandstatus[len(tid):]
                break
        if strict and taskid in persondata:
            errors.append('duplicate entry: %s' % line)
        persondata[taskid] = Cache(
            taskid=taskid,
            description=what.split('[')[0].strip(),
            full=what,
            chosen=True,
            status=status,
            done='+' in status)

    if errors:
        raise Exception('\n'.join(errors))
    return people


@expose()
def py_students(source='tasks.txt'):
    results = []
    for name, info in py_tasks(source).items():
        for tid in ['1', '2', '3', 'projektukas', 'testukas', 'iskaita']:
            info.setdefault(tid, Cache(
                taskid=tid,
                description=None,
                full=None,
                chosen=False,
                status=None,
                done=False,
                should_choose=False,
            ))
        any_of_the_three_chosen = False
        all_done = True
        for tid in ['1', '2', '3']:
            any_of_the_three_chosen = any_of_the_three_chosen or info[tid]['chosen']
            info[tid]['should_choose'] = not info['projektukas']['chosen']
            all_done = all_done and info[tid]['done']
        all_done = all_done or info['projektukas']['done']
        info['all_done'] = all_done
        info['projektukas']['should_choose'] = not any_of_the_three_chosen
        info['iskaita']['done'] = info['testukas']['done'] and all_done
        info['uzd'] = [info[taskid] for taskid in ['1', '2', '3', 'projektukas', 'testukas', 'iskaita']]
        name, surname = (name.split() + ['???', '???'])[:2]
        results.append((surname, name, info))
    results.sort()
    return [row[-1] for row in results]


@expose()
def py_students_by_group(source='../tasks.txt'):
    groups = {}
    for row in py_students(source):
        try:
            group = row['fullinfo'].split('(', 1)[1].split(')')[0]
            group = group.replace('informatika', u'kompiuterių mokslas')
        except IndexError:
            group = '???'
        groups.setdefault(group, []).append(row)

    results = groups.items()
    results.sort()
    return [
        Cache(
            title=title,
            students=students,
            count=len(students),
            count_done=sum([1 for s in students if s['iskaita']['done']]),
        ) for title, students in results
    ]


@expose()
def py_student_totals(source='tasks.txt'):
    n_students = 0
    n_all_done = 0
    n_passed = 0
    for row in py_students(source):
        n_students += 1
        if row['all_done']:
            n_all_done += 1
        if row['iskaita']['done']:
            n_passed += 1
    return Cache(
        students=n_students,
        done_all=n_all_done,
        passed=n_passed)


@expose()
def py_taken(taskid, source='tasks.txt'):
    tasks = []
    for persondata in py_tasks(source).values():
        task = persondata.get(taskid, {}).get('description')
        done = persondata.get(taskid, {}).get('done')
        if task:
            tasks.append((task, persondata['name'], done))
    tasks.sort()
    return [
        Cache(
            task=task,
            student=name,
            done=done,
            done_suffix=(done and ' [+]' or ''),
        ) for task, name, done in tasks
    ]

