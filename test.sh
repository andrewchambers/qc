set -e

mbld

for t in ./test/*.c
do
	timeout 2s ./qc < $t > $t.ssa
	timeout 2s ../qbe/lisc/lisc < $t.ssa > $t.s
	timeout 2s gcc $t.s -o $t.bin
	if ! timeout 2s $t.bin
	then
		echo "$t failed"
	fi
	echo $t PASS	
done
