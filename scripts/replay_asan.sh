files=`find -name "id:*"`
replay_prog=$1
let i=0
let now=0
for file in ${files}
do
        echo "now ${file}, total ${now}"
        timeout 5s ${1} ${file} &
	pid=$!
	echo  "${pid}  ${file}" >> cmdlog
        i=$((i+1))
	now=$((now+1))
       if [ ${i} -gt 256 ] ; then
               wait
               i=0
       fi
done

