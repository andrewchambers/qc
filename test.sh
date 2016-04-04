set -e

mbld

for t in ./test/*.c
do
	timeout 2s ./qc < $t > $t.ssa
	timeout 2s ../qbe/obj/qbe $t.ssa > $t.s
	timeout 2s gcc $t.s -o $t.bin
	if ! timeout 2s $t.bin
	then
		echo "$t.bin returned non zero"
		exit $?
	fi
	echo $t PASS	
done
