set -e

echo "MTEST -1"

for t in ./test/execute/*.c
do
	echo "test $t <<{!"
	
	if ! timeout 2s ./qc -I./test/execute/include $t > $t.ssa
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
		echo "!}>> fail returned non zero"
		continue
	fi
	
	echo "!}>> ok"
done

for t in test/error/*.c
do
	echo "test $t <<{!"
	
	if ./qc $t > /dev/null 2> $t.stderr
	then
		echo "!}>> fail qc returned zero"
		continue
	fi
	
	
	status=pass
	for p in `sed -n '/^PATTERN:/s/PATTERN://gp' $t`
	do
		if ! grep -q $p $t.stderr
		then
			echo "!}>> fail pattern $p not found"
			status=fail
			break
		fi
	done
	
	if [ $status = pass ]
	then
		echo "!}>> ok"
	fi
done
