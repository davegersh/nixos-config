# needed to allow automatic importing of all files in the nixos directory

{lib, ... }: {
    imports = [
        ./audio.nix
        ./nvidia.nix
        ./fonts.nix
        ./python.nix
        ./network.nix
        ./i3.nix
        ./gnome.nix
    ];
}
