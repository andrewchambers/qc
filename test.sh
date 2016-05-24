set -e


echo "MTEST -1"
for t in ./test/*.c
do
	echo "test $t <<{!"
	
	if ! timeout 2s ./qc < $t > $t.ssa
	then
		echo "!}>> fail qc failed"
		continue
	fi
	
	if ! timeout 2s ../qbe/obj/qbe $t.ssa > $t.s
	then
		echo "!}>> fail qbe failed"
		continue
	fi
	
	if ! timeout 2s gcc $t.s -o $t.bin
	then
		echo "!}>> fail assembling failed"
		continue
	fi
	
	if ! timeout 2s $t.bin 
	then
		echo "!}>> returned non zero"
		continue
	fi
	
	echo "!}>> ok"
done
