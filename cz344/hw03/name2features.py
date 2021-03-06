#!/usr/bin/python
import sys
def hashfeatures(name):
  B=65536; # number of dimensions in our feature space
  v=[0]*B; # initialize the vector to be all-zeros
  name=name.lower() # make all letters lower case
  # hash prefixes & suffixes
  name_new=''
  name_new += name[0]
  name_new += name[1]
  nn=0
  for i in range(2,len(name)):
    if name_new[i-2-nn]==name_new[i-1-nn] and name_new[i-1-nn]==name[i]:
        nn=nn+1
        continue
    name_new += name[i]
  name = name_new
  
  for m in range(8):
    featurestring='prefix'+name[0:min(m+1,len(name))]
    v[hash(featurestring) % B]=1
    featurestring='suffix'+name[-1:-min(m+2,len(name)+1):-1]
    v[hash(featurestring) % B]=1
  featurestring='midfix'+name[2:4]
  for i in range(3,len(name)-4):
    if featurestring=='midfix'+name[i:i+2]:
      continue
    featurestring='midfix'+name[i:i+2]
    v[hash(featurestring) % B]=1
  featurestring='midfix'+name[2:5]
  for i in range(3,len(name)-5):
    if featurestring=='midfix'+name[i:i+3]:
      continue
    featurestring='midfix'+name[i:i+3]
    v[hash(featurestring) % B]=1
  return v

for name in sys.stdin:
  print ','.join(map(str,hashfeatures(name.strip())))