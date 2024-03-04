Linux Kernel Modules for NixOS
You can find what kernel modules are loaded using lsmod.

However some kernel modules are required at stage 1 boot. Basically preloaded in the initial ram disk before switching to the root filesystem. These kernel modules are mostly needed to deal with peripherals, storage devices, filesystems and network devices. You may need to be wary of these required modules:

sd_mod - SCSI, SATA, and PATA (IDE) devices
ahci - SATA devices on modern AHCI controllers
nvme - NVMe drives (really fast SSDs)
usb_storage - Utilize USB Mass Storage (USB flash drives)
usbhid - USB Human Interface Devices
uas - USB attached SCSI drives
xhci_pci - USB 3.0 (eXtensible Host Controller Interface)
ehci_pci - USB 2.0 (Enhanced Host Controller Interface)
sdhci_pci - Secure Digital Host Controller Interface (SD cards)
rtsx_pci_sdmmc - Realtek PCI-E SD/MMC Card Host Driver
These modules are meant to be set with boot.initrd.availableKernelModules in NixOS.

Beware of boot.initrd.supportedFilesystems for bringing in filesystem modules.

These modules will most likely be found with nixos-generate-config during the installation process.

After switching to the root filesystem, the kernel modules that are available are controlled by:

boot.hardwareScan
boot.kernelModules
boot.supportedFilesystems
The boot.hardwareScan usually brings almost everything you need. However you may also need:

kvm-intel - KVM on Intel CPUs
kvm-amd - KVM on AMD Cpus
coretemp - Temperature monitoring on Intel CPUs
k10temp - Temperature monitoring on AMD CPUs