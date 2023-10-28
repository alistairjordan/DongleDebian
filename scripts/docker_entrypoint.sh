set -e

case ${1} in
	"clean")
		./scripts/clean_all.sh
		;;
	"build")
		./scripts/build_all.sh
		;;
	*)
		echo "Select option 'build' or 'clean'"
		echo "docker run -it  --privileged --mount type=bind,source=\"$(pwd)\",target=/dongle dongle build"
		;;
esac
