import os
import plistlib
import sys

from os.path import abspath

plist_name = sys.argv[1]
script_dir = os.path.dirname(os.path.realpath(__file__))
target_dir = "%s/../dist/frameworks" % script_dir
plist_path = "%s/%s" % (target_dir, plist_name)
plist_filename = abspath(plist_path)

print('Modifying plist: ', plist_filename)

with open(plist_filename, 'rb') as infile:
    pl = plistlib.load(infile)
available_libs = pl['AvailableLibraries']
for lib in available_libs:
    lib['HeadersPath'] = '../Headers'
outfile = open(plist_filename, 'wb')
plistlib.dump(pl, outfile)
outfile.close()

