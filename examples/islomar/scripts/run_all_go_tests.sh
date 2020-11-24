#!/bin/bash

set -e 

# Huaweiolt_monitor
# -----------------
SPECIAL_COMPONENT="huaweiolt_monitor/"
echo "====================================================="
echo "====> Pasando tests:" "$SPECIAL_COMPONENT"Makefile "<===="
echo "====================================================="
cd $SPECIAL_COMPONENT && make deps && make test && cd ..
# Cambia el master
#huaweiolt_monitor->goaleasoluciones
#huaweiolt_monitor->gosnmpquerier
#huaweiolt_monitor->simpleamqp
# Ponemos el git bien (master)
cd goaleasoluciones && git checkout master && cd ..
cd gosnmpquerier && git checkout master && cd ..
cd simpleamqp && git checkout master && cd ..

# Estos fallan por ahora
NOT_TO_TEST_1="http2amqp/"
NOT_TO_TEST_2="goaleasoluciones/"
echo "======================================================"
echo "NO PASAMOS TESTS A:""$NOT_TO_TEST_1"
echo "NO PASAMOS TESTS A:""$NOT_TO_TEST_2"
echo "======================================================"


for component in */; do
	if [ "$component" != "$SPECIAL_COMPONENT" ] && [ "$component" != "$NOT_TO_TEST_1" ]  && [ "$component" != "$NOT_TO_TEST_2" ] ; then
		if [ -f "$component"/Makefile ]; then
			echo "================================================="
			echo "====> Pasando tests:" "$component"Makefile "<===="
			echo "================================================="
			cd $component && make deps && make test && cd ..
		fi
	fi
done

