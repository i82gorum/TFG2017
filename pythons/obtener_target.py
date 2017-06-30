#! /usr/bin/python
### Dependencias y librerias
from xml.etree import ElementTree

print 'Estoy en el python de target'

with open('../temporales/target_id.xml', 'rt') as f:
    tree = ElementTree.parse(f)

print 'abro el target_id,xml'

for node in tree.iter('create_target_response'):
    id_target = node.attrib.get('id')
    print '%s' % (id_target)
