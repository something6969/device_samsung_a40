#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/13500000.dwmmc0/by-name/recovery$(getprop ro.boot.slot_suffix):44709888:096c489d04165319c2ab2930492d7b18dbdc338b; then
  applypatch --bonus /vendor/etc/recovery-resource.dat \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/13500000.dwmmc0/by-name/boot$(getprop ro.boot.slot_suffix):33280000:0fa56d657b33697fdd8c5bbfb5ddff57a1655d65 \
          --target EMMC:/dev/block/platform/13500000.dwmmc0/by-name/recovery$(getprop ro.boot.slot_suffix):44709888:096c489d04165319c2ab2930492d7b18dbdc338b && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
