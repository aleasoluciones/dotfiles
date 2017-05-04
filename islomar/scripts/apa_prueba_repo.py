# -*- coding: utf-8 -*-

from infrastructure import factory as infrastructure_factory
from xema.core.infrastructure import repositories

NETWORK = 'lab'

class KeyValueAPARepository(repositories.KeyValueRepository):
    COLLECTION = 'apa_repo_prueba'

#    def put(self, network, objeto):
#        super(self.__class__, self).put(network, objeto)

class Isidro(object):
	def __init__(self, id, a1, a2, a3):
		self.id = id
		self._a1 = a1
		self._a2 = a2

	def __str__(self):
		return repr(self.__dict__)


if __name__ == '__main__':
	apa_repo = KeyValueAPARepository(infrastructure_factory.redis_keyvalue())

	obj1 = Isidro(1, 1, 1, 1)
	obj2 = Isidro(2, 2, 2, 2)
	obj3 = Isidro(3, 3, 3, 3)

	#apa_repo.put(NETWORK, obj1)
	#apa_repo.put(NETWORK, obj2)
	#apa_repo.put(NETWORK, obj3)
	#for obj in apa_repo.find_all(NETWORK):
	#	print "obj: ", obj
	#	# manipulo
	#	obj._a2 = obj._a2 + 1
	#	apa_repo.put(NETWORK, obj)

	print ""

	for obj in apa_repo.find_all(NETWORK):
		print "obj: ", obj
	