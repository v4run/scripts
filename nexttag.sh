#!/usr/bin/env python
import sys,subprocess
p1 = subprocess.Popen(["git","tag","--sort=-refname"], stdout=subprocess.PIPE)
p2 = subprocess.Popen(["head","-n","1"], stdin=p1.stdout, stdout=subprocess.PIPE)
p1.stdout.close()
tag = p2.communicate()[0].strip()
print ".".join("#".join(list(str(int("".join(tag.split(".")))+1).rjust(tag.count(".")+1, '0'))).rsplit("#", tag.count("."))).replace("#", "")
