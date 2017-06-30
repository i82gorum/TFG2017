#!/usr/bin/python
### Dependencias y librerias
from xml.etree import ElementTree

with open('../temporales/report_id.xml', 'rt') as f:
    tree = ElementTree.parse(f)

for path in [ './report_id' ]:
    node = tree.find(path)
    print node.text
