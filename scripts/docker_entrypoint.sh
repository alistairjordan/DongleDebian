set -e

case ${1} in
	"clean")
		./scripts/clean_linux.sh
		./scripts/clean_debian.sh
		./scripts/clean_rootfs.sh
		./scripts/clean_boot.sh
		;;
	"build")
		./scripts/build_linux.sh
		./scripts/create_debian.sh
		./scripts/create_boot.sh
		;;
	*)
		echo "Select option 'build' or 'clean'"
		echo "docker run -it  --privileged --mount type=bind,source=\"$(pwd)\",target=/dongle dongle build"
		;;
esac
