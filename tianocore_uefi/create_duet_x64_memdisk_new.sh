#!/bin/sh

set -x -e

SOURCE_CODES_DIR="/media/Data_2/Source_Codes"
WD="${SOURCE_CODES_DIR}/Firmware/UEFI/TianoCore_Sourceforge"

source "${WD}/tianocore_duet_common.sh"

CREATE_MEMDISK() {
	
	echo
	
	sudo rm -rf "${BOOTPART}/memdisk_syslinux" || true
	sudo cp "${SYSLINUX_DIR}/memdisk" "${BOOTPART}/memdisk_syslinux"
	
	echo
	
	rm -rf "${WD}/duet_x64_memdisk.bin" || true
	dd if=/dev/zero of="${WD}/duet_x64_memdisk.bin" bs=512 count=2880
	mkfs.vfat -F12 -S 512 -n "EFI_DUET" "${WD}/duet_x64_memdisk.bin"
	
	echo
	
}

COMPILE_MEMDISK() {
	
	echo
	
	# CREATE_MEMDISK
	
	echo
	
	MIGLE_BOOTDUET_COMPILE
	
	echo
	
	sudo modprobe loop
	LOOP_DEVICE=$(losetup --show --find "${WD}/duet_x64_memdisk.bin")
	
	echo
	
	sudo "${SRS5694_DUET_INSTALL_DIR}/duet-install" -b "${MIGLE_BOOTDUET_COMPILE_DIR}" -s "${SYSLINUX_DIR}" -u "${EFI_DUET_GIT_DIR}" "${LOOP_DEVICE}"
	
	echo
	
	MIGLE_BOOTDUET_CLEAN
	
	echo
	
	losetup --detach "${LOOP_DEVICE}"
	
	echo
	
}

echo

CREATE_MEMDISK

echo

COMPILE_MEMDISK

echo

unset SOURCE_CODES_DIR
unset WD
unset EDK2_DIR
unset EDK2_BUILD_TOOLS_DIR
unset EDK2_C_SOURCE_DIR
unset EDK2_DUET_BOOTSECT_BIN_DIR
unset EDK2_BUILD_DIR
unset DUET_EMUVARIABLE_BUILD_DIR
unset DUET_FSVARIABLE_BUILD_DIR
unset COMPILED_DIR
unset EFI_DUET_GIT_DIR
unset MEMDISK_COMPILED_DIR
unset MEMDISK_DIR
unset MIGLE_BOOTDUET_COMPILE_DIR
unset SRS5694_DUET_INSTALL_DIR
unset BOOTPART
unset EFISYS
unset SYSLINUX_DIR

set +x +e