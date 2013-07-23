import subprocess

p = subprocess.Popen(['./processdemo.py', 'a b c', 'd', 'e'],
                     stdout=subprocess.PIPE)
stdout, stderr = p.communicate()
print 'Gavau: %r' % stdout
