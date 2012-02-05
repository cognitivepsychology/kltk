#!/usr/bin/python
# -*- coding: utf-8; tab-width: 4 -*-
# Extracts EC dependency pairs 
# $Id$ 
""" extract-ec-pair : extracts EC dependency pairs 
(section 5.2)

USAGE:
$ extract-ec-pair sejong-parsed.dep > ec-pair.list
"""

import codecs
import sys
import re
from kltk.corpus.sejong.dep import ForestWalker

class Encode:
    def __init__(self, stdout, enc):
        self.stdout = stdout
        self.encoding = enc

    def write(self, s):
        self.stdout.write(s.encode(self.encoding))

class DoIt:
	def __init__(self, file, output_encoding):
		self.fw = ForestWalker(file)
		sys.stdout = Encode(sys.stdout, output_encoding)
		self.print_emi_pair()

	def print_emi_pair(self):
		for tree in self.fw:
			for n in tree.nodes:
				if n.word.has_pos("EC") \
				   and n.parent is not None \
				   and n.parent.word.has_pos("EC"):
					sys.stdout.write(tree.id + " ; ")
					for m in n.word.morphs:
						if m.pos == "EC" :
							sys.stdout.write(" -" + m.form)
					sys.stdout.write(" < ")
					for m in n.parent.word.morphs:
						if m.pos == "EC" :
							sys.stdout.write(" -" + m.form)
					sys.stdout.write("\n")


if __name__ == '__main__':
	file = codecs.open(sys.argv[1], encoding='utf-8')
	DoIt(file, 'utf-8')
	file.close()
