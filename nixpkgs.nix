let
  fetchNixpkgs = { rev, sha256 } : builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
    inherit sha256;
  };
in
  import (fetchNixpkgs {
    rev = "6db7f92cc2af827e8b8b181bf5ed828a1d0f141d";
    sha256 = "1hpgn22j35mgfyrrkgyg28fm4mzllk5wfv5mrrn29kiglqb462fr";
  }) { config = {}; }
