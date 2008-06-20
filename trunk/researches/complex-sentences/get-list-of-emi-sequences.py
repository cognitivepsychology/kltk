#!/usr/bin/python
# -*- coding: utf-8; tab-width: 4 -*-
# search.py
# Search emi matrix
# $Id$

import re
import codecs
import sys
import kltk.corpus.sejong.sense

def cat (str1, str2):
    return str1 + " " + str2

def combine_list(a, b):
    temp = []
    for i in xrange(0, len(a)):
        temp.append(a[i] + "/" + b[i])
        return temp

class Encode:
   def __init__(self, stdout, enc):
      self.stdout = stdout
      self.encoding = enc
   def write(self, s):
      self.stdout.write(s.encode(self.encoding))

file = codecs.open(sys.argv[1], 'r', 'utf-8')
corpus = kltk.corpus.sejong.sense.Corpus(file)
sys.stdout = Encode(sys.stdout, 'utf-8')

TAG_E = re.compile('(EC|EF|ETM|ETN)')
form = []
pos = []
for sentence in corpus:
    form = []
    pos = []
    for word in sentence.wordlist:
        #print word.gid, word.ord, word.form
        for morph in word.morphlist:
            #print morph.form, morph.pos, morph.sem
            if TAG_E.match(morph.pos):
                form.append(morph.form)
                pos.append(morph.pos)
            #elif morph.pos == 'VX' :
            #   form.append(morph.form)
            #   pos.append(morph.pos)
    if len(form) > 0 :
        print sentence.gid, reduce(cat, combine_list(form, pos)) 
        print sentence.form







# 
# 
# TAG_SF = re.compile('.+SF')
# TAG_EC = re.compile('.+(EC|EF|ETM|ETN).*')
# TAG_SEP = re.compile('.*[^ ][+][^ ].*')
# 
# 
# 
# # print V + VX construction
# def print_vx_construction():
#    for sentence in corpus:
#        for word in sentence.wordlist:
#            if word.morphlist[0].pos == "VX":
#                if word.ord > 2:
#                    print sentence.wordlist[word.ord-2].form, \
#                           word.morphlist[0].form
# 
# 
# # print clause
# #
# # V VX
# # ETM NNB 
# #
# 
# for sentence in corpus:
#   print sentence.form
#   for w in sentence:
#       print w.form,
# 
#         if w.has('ETM'):
#           if w.ord < len(sentence.wordlist):
#               if sentence.wordlist[w.ord].has('NNB'):
#                   print "<nnb>",
#               else:
#                   print "<ETM>"
#             else:
#                   print "<ETM>"
#         elif w.has('(ETN)'):
#             print "<ETN>"
#         elif w.has('VA[+]게/EC'):
#             print "<EC>" 
#         elif w.has('V.+[+]게/EC'):
#             print w.ma_str, "<EC>",
#         elif w.has('EC'):
#           if w.ord < len(sentence.wordlist):
#               if sentence.wordlist[w.ord].has('VX'):
#                   print "<vx>",
#                 else:
#                   print "<EC>"
#             else:
#                 print "<EC>"
#         elif w.has('EF'):
#             print "<EF>"
#   print
#     print "========"
# 
# 