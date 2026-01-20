#!/usr/bin/env bash




##
## ## Init
##

REF_CMD_FILE_NAME="$(basename "${0}")"
REF_BASE_DIR_PATH="$(dirname "$(realpath "${0}")")"




##
## ## Default
##

DEFAULT_TARGET_NAME="ubuntu-iso-builder-respin-xfce"
REF_TARGET_NAME="${REF_TARGET_NAME:=$DEFAULT_TARGET_NAME}"




##
## ## Args
##

REF_TARGET_NAME=${1}
REF_TARGET_NAME="${REF_TARGET_NAME:=$DEFAULT_TARGET_NAME}"




##
## ## Path
##

REF_PLAN_DIR_PATH="$(realpath "${REF_BASE_DIR_PATH}/..")"
REF_BUILD_DIR_PATH="${REF_PLAN_DIR_PATH}/build"
REF_PORT_DIR_PATH="/port"




##
## ## Path / Master
##

REF_MASTER_FILE_NAME="${REF_TARGET_NAME}"
REF_MASTER_DIR_PATH="${REF_BUILD_DIR_PATH}/${REF_MASTER_FILE_NAME}"
REF_MASTER_REPO_URL_GIT="https://github.com/samwhelp/${REF_MASTER_FILE_NAME}.git"
REF_MASTER_REPO_BRANCH_NAME="main"




##
## ## Path / Dist
##

REF_SRC_DIST_DIR_PATH="${REF_MASTER_DIR_PATH}/dist"
REF_DES_DIST_DIR_PATH="${REF_PORT_DIR_PATH}/dist"




##
## ## Env
##

echo
echo "export DEBIAN_FRONTEND=noninteractive"
export DEBIAN_FRONTEND=noninteractive
echo




##
## ## Model / Module
##

mod_build_prepare_dir () {

	mkdir -p "${REF_BUILD_DIR_PATH}"

}

mod_build_prepare_package () {

	apt-get update

	apt-get install systemctl sudo debootstrap -y

	apt-get install make git wget curl -y

}

mod_build_prepare () {

	mod_build_prepare_dir

	mod_build_prepare_package

}


mod_build_ubuntu_iso () {

	echo
	echo "##"
	echo "## ## Run: create iso"
	echo "##"
	echo

	mod_build_ubuntu_iso_download_source

	mod_build_ubuntu_iso_create

}

mod_build_ubuntu_iso_download_source () {

	echo
	echo "##"
	echo "## ## Run: download-source"
	echo "##"
	echo

	git clone -b "${REF_MASTER_REPO_BRANCH_NAME}" "${REF_MASTER_REPO_URL_GIT}" "${REF_MASTER_DIR_PATH}"

}

mod_build_ubuntu_iso_create () {

	echo
	echo "##"
	echo "## ## Run: create"
	echo "##"
	echo

	cd "${REF_MASTER_DIR_PATH}"

	make build

	cd "${OLDPWD}"

}

mod_build_copy_iso_file_to_port_dir () {

	echo
	echo "##"
	echo "## ## Run: copy-to-port"
	echo "##"
	echo

	mkdir -p "${REF_PORT_DIR_PATH}"

	cp -rfT "${REF_SRC_DIST_DIR_PATH}" "${REF_DES_DIST_DIR_PATH}"

	echo
	echo "##"
	echo "## ## Tips: please check port dir"
	echo "##"
	echo

}




##
## ## Model / Portal
##

mod_build_main ()  {

	mod_build_prepare

	mod_build_ubuntu_iso

	mod_build_copy_iso_file_to_port_dir

}




##
## ## Main
##

__main__ () {

	mod_build_main

}

__main__
