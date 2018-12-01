set -x
cur_dir=`pwd`
mkdir Tin
mkdir Tout
cd testsuite/

find -name "*.s"  -exec cp {}  ${cur_dir}/Tin \;
