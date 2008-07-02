#!/usr/bin/python
# -*- coding: utf-8; tab-width: 4 -*-
#
# $Id$ 
""" extract-clause-pair : extracts clause dependency pairs 
(section 5.3)

USAGE:
$ extract-clause-pair sejong-parsed.dep > clause-pair.list
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

class Test:
	def __init__(self, file, output_encoding):
		self.fw = ForestWalker(file)
		sys.stdout = Encode(sys.stdout, output_encoding)
		self.print_clause_pair()
	

	def print_clause_pair(self):
		for tree in self.fw:
			for n in tree.nodes:
				if self._check_emi_in(n.word) and not n.word.has_pos("VX") :
					sys.stdout.write(tree.id + " ; " + tree.sentence_form +"\n")
					self._print_node(n)
					m = n
					while m.parent is not None \
							and not (self._check_emi_in(m.parent.word) \
							and m.word.has_pos("VX")):
						m = m.parent
						self._print_node(m)

					if m.parent is not None:
						self._print_node(m.parent)
					sys.stdout.write("================\n")

	def _print_node(self, node):
		print node.ord + "\t" + node.dep + "\t" + node.tag1 + "\t" + node.tag2 + "\t" + node.word.form  + "\t" + node.word.morph_string
#		sys.stdout.write(node.word.morph_string)
#		for m in node.word.morphs:
#			if self._is_emi(m.pos) :
#				sys.stdout.write("<" + m.form + "/" + m.pos + "> ")



	def _check_emi_in(self, word) :
		return word.has_pos("EC") \
			or word.has_pos("ETN") \
			or word.has_pos("ETM") \
			or word.has_pos("EF")

	def _is_emi(self, pos) :
		return pos == "EC" or pos == "ETM" or pos == "ETN" or pos == "EF"

if __name__ == '__main__':
	file = codecs.open(sys.argv[1], encoding='utf-8')
	Test(file, 'utf-8')
	file.close()
