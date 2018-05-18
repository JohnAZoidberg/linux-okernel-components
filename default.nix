with import ./nixpkgs.nix;
let
  buildModule =
  { name, src, kernel }:
  stdenv.mkDerivation {
    inherit name;
    inherit src;

    hardeningDisable = [ "pic" ];

    KERNELDIR = "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build";
    INSTALL_MOD_PATH = "\${out}";
    INSTALL_ROOT = "\${out}";

    nativeBuildInputs = kernel.moduleBuildDependencies;
  };
  kernel = pkgs.linuxPackages_latest.kernel;
  makeFlags = "DESTDIR= PREFIX=$(out)";  # is this not standard?
in
{
  userspace-tools = stdenv.mkDerivation {
    name = "okernel-userspace-tools";
    src = ./userspace_tools/.;

    nativeBuildInputs = [ glibc.static ];

    inherit makeFlags;
  };
  cve-201608655 = stdenv.mkDerivation {
    name = "cve-201608655";
    src = ./test_mappings/exploits/CVE-2016-8655/.;

    buildPhase = ''
      gcc chocobo_root.c -lpthread -o chocobo_root
    '';

    installPhase = ''
      mkdir -p $out/bin
      mv chocobo_root $out/bin/
    '';
  };
  cve-2017-7308 = stdenv.mkDerivation {
    name = "cve-201608655";
    src = ./test_mappings/exploits/CVE-2017-7308/.;

    buildPhase = ''
      gcc original_poc.c -o original_poc
    '';

    installPhase = ''
      mkdir -p $out/bin
      mv original_poc $out/bin/
    '';
  };
  kvc = stdenv.mkDerivation {
    name = "kvc";
    src = ./test_mappings/protected-mem/kvc/.;

    inherit makeFlags;
  };
  pvm = stdenv.mkDerivation {
    name = "pvm";
    src = ./test_mappings/protected-mem/pmc/.;

    inherit makeFlags;
  };
  smep = stdenv.mkDerivation {
    name = "smep";
    src = ./test_mappings/smep/.;

    inherit makeFlags;
  };
  user-mem-track = stdenv.mkDerivation {
    name = "user-mem-track";
    src = ./test_mappings/user-mem-track/.;

    inherit makeFlags;
  };
  kvmod = buildModule {
    inherit kernel;
    name = "kvmod";
    src = ./test_mappings/protected-mem/kvmod/.;
  };
  kwriter = stdenv.mkDerivation {
    name = "kwriter";
    src = ./test_mappings/kwriter/.;

    hardeningDisable = [ "pic" ];
    buildInputs = [ python ];

    KERNELDIR = "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build";
    INSTALL_MOD_PATH = "\${out}";
    INSTALL_ROOT = "\${out}";

    nativeBuildInputs = kernel.moduleBuildDependencies;

    installPhase = ''
      mkdir -p $out/bin
      mv chkresults $out/bin/
      chmod +x $out/bin/chkresults

      make install
    '';
  };
  oktest-init = buildModule {
    inherit kernel;
    name = "oktest-init";
    src = ./test_mappings/oktest-init/.;
  };
  vsys-update = buildModule {
    inherit kernel;
    name = "vsys-update";
    src = ./test_mappings/vsys-update/.;
  };
}
