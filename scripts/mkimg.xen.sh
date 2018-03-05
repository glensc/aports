build_xen() {
	apk fetch --root "$APKROOT" --stdout xen-hypervisor | tar -C "$DESTDIR" -xz boot
}

section_xen() {
	[ -n "${xen_params+set}" ] || return 0
	build_section xen $ARCH $(apk fetch --root "$APKROOT" --simulate xen-hypervisor | checksum)
}

profile_xen() {
	profile_standard
	title="Xen"
	desc="Build-in support for Xen Hypervisor.
		Includes packages targed at Xen usage.
		Use for Xen Dom 0."
	arch="x86_64"
	kernel_cmdline="nomodeset"
	xen_params=""
	apks="$apks ethtool lvm2 mdadm multipath-tools openvswitch sfdisk xen xen-bridge"
#	apkovl="genapkovl-xen.sh"
}
