#!/usr/bin/python
### Dependencias y librerias
from xml.etree import ElementTree

with open('../temporales/task_id.xml', 'rt') as f:
    tree = ElementTree.parse(f)

for node in tree.iter('create_task_response'):
    id_target = node.attrib.get('id')
    print '%s' % (id_target)
