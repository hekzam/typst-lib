heckzam's typst lib
===================
Typst library to help the generation of exam sheets.

How to run tests?
-----------------
1. Install Nix: https://nixos.org/download
2. Enable the `nix` command and flakes in your Nix configuration: write `experimental-features = nix-command flakes` to `~/.config/nix/nix.conf`.
3. Enter the development shell: `nix develop .#dev`
4. From the `test` directory, run `pytest`. This should run tests, return 0 and populate `/tmp/test-out` with various test files.
