import os
import sys
import xml.etree.ElementTree as ET

from os.path import abspath

plist_name = sys.argv[1]
script_dir = os.path.dirname(os.path.realpath(__file__))
target_dir = "%s/../dist/frameworks" % script_dir
plist_path = "%s/%s" % (target_dir, plist_name)
plist_filename = abspath(plist_path)

print('Modifying plist: ', plist_filename)

tree = ET.parse(plist_filename)
root = tree.getroot()
available_libs = root[0][1]

for lib in available_libs:
    key = ET.SubElement(lib, 'key')
    key.text = 'HeadersPath'
    headers = ET.SubElement(lib, 'string')
    headers.text = '../Headers'

tree.write(plist_filename)

