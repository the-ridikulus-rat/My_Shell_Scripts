#!/usr/bin/env bash

_GRUB2_UEFI_LINUX="${PWD}/grub2_uefi.sh"
_GRUB2_UEFI_LINUX_MY="${_GRUB2_UEFI_LINUX} x86_64 /boot/efi /boot grub_Keshav /media/Data_3/grub_uefisys_x86_64_backup /media/Data_3/grub_uefi_x86_64_bootdir_backup /media/Data_3/grub_uefi_x86_64_utils_Backup /_grub_Keshav_/uefi_x86_64/"

echo

echo "${_GRUB2_UEFI_LINUX} [TARGET_UEFI_ARCH] [UEFI_SYSTEM_PART_MOUNTPOINT] [GRUB2_UEFI_BOOTDIR] [GRUB2_UEFI_INSTALL_DIR_NAME] [GRUB2_UEFISYS_BACKUP_DIR_PATH] [GRUB2_UEFI_BOOTDIR_BACKUP_DIR_PATH] [GRUB2_UEFI_UTILS_BACKUP_DIR_PATH] [GRUB2_UEFI_PREFIX_DIR_PATH]"

echo

# echo "${_GRUB2_UEFI_LINUX_MY}"

echo

set -x

${_GRUB2_UEFI_LINUX_MY}

echo

set +x

unset _GRUB2_UEFI_LINUX
unset _GRUB2_UEFI_LINUX_MY