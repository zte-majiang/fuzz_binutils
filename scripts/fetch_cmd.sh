#set -x
pid=$1
pid=$((pid-3))
for file in `grep "^${pid} " $2`
do
	file=${file#*/}
	file=../${file}
	./as-simple $file &> /dev/null
	ls asan* &> /dev/null
	if [ $? -eq 0 ] ; then
		echo "now ${file} producing log"
		rm asan* -f
		exit 0
	fi
done

echo "not found"

