#! /bin/bash
set -x

if [ $# -eq 0 ]; then
	echo "用法: 传入<数字1-6>"
	exit 1
fi

num=$1
arrs=("prepare_for_manual_instrument" "prepare_kernel_bitcode" \
	"analyze_kernel_syscall" "extract_syscall_entry" \
	"instrument_kernel_with_distance" "fuzz")

source config.sh

args="-j ${J} -WorkdirPrefix ${WORKDIR_PREFIX} -linux-repo-template ${LINUX_REPO_TEMPLATE} -dataset ${DATASET} -fuzz-rounds ${FUZZ_ROUNDS}"
# echo "args: ${args}"

case $num in
	1)
		python3 Main.py ${arrs[0]} ${args}
		;;
	2)
		python3 Main.py ${arrs[1]} ${args}
		;;
	3)
		python3 Main.py ${arrs[2]} ${args}
		;;
	4)
                python3 Main.py ${arrs[3]} ${args}
                ;;
	5)
                python3 Main.py ${arrs[4]} ${args}
                ;;
	6)
                python3 Main.py ${arrs[5]} ${args} -uptime 72
                ;;
	*)
		echo "错误!只支持传入1,2,3,4,5,6"
		exit 1
esac



