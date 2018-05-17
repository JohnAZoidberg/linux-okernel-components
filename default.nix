with import ./nixpkgs.nix;
let
  buildModule =
  { name, src, kernel ? null }:
  stdenv.mkDerivation {
    inherit name;
    inherit src;

    hardeningDisable = [ "pic" ];

    KERNELDIR = "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build";
    INSTALL_MOD_PATH = "\${out}";
    INSTALL_ROOT = "\${out}";

    nativeBuildInputs = kernel.moduleBuildDependencies;

    buildPhase = "make";
  };
  kernel = pkgs.linuxPackages_latest.kernel;
in
{
  userspace-tools = stdenv.mkDerivation {
    name = "okernel-userspace-tools";
    src = ./userspace_tools/.;

    buildInputs = [ glibc.static ];

    makeFlags = "DESTDIR= PREFIX=$(out)";
  };
  kvmod = buildModule {
    inherit kernel;
    name = "kvmod";
    src = ./test_mappings/protected-mem/kvmod/.;
  };
  kwriter = buildModule {
    inherit kernel;
    name = "kwriter";
    src = ./test_mappings/kwriter/.;
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
