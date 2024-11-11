{
  description = "A Nix-flake-based LaTeX development environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.nix-github-actions.url = "github:nix-community/nix-github-actions";
  inputs.nix-github-actions.inputs.nixpkgs.follows = "nixpkgs";

  outputs = { self, nixpkgs, nix-github-actions }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f rec {
        pkgs = import nixpkgs { inherit system; };
        fonts = with pkgs; [
          lmodern
          source-han-sans
          source-han-serif
          source-han-mono
        ];
        deps = pkgs.buildEnv {
          name = "latex-env";
          paths = with pkgs;[
            mustache-go
            poppler_utils
            findutils
            texlive.combined.scheme-full
            texlab
            tectonic
          ];
        };
      });
    in
      {
        githubActions = nix-github-actions.lib.mkGithubMatrix {
          checks = nixpkgs.lib.getAttrs [ "x86_64-linux" ] self.packages;
        };
        packages = forEachSupportedSystem ({ pkgs, fonts, deps }: {
          default = pkgs.stdenvNoCC.mkDerivation rec {
            name = "mycv";
            src = self;
            buildInputs = [ pkgs.coreutils deps ];
            FONTCONFIG_FILE = pkgs.makeFontsConf { fontDirectories = fonts; };
            phases = ["unpackPhase" "buildPhase" "installPhase"];
            buildPhase = ''
              export PATH="${pkgs.lib.makeBinPath buildInputs}";
              # Directory with templates
              SRC_DIR="./templates"

              # Directory to save the processed files
              DST_DIR="./sections"

              # Data for rendering
              DATA_FILE="data.yaml"

              find "$SRC_DIR" -type f -name '*.tpl' | while read -r SRC_PATH; do

                # Create destination path by switching SRC_DIR with DST_DIR and removing .tpl extension
                DST_PATH="''${SRC_PATH/$SRC_DIR/$DST_DIR}"
                DST_PATH="''${DST_PATH%.*}"

                # Create directory if it does not exist
                mkdir -p "$(dirname "$DST_PATH")"

                # Render template and save it to destination path
                mustache data.yaml "$SRC_PATH" > "$DST_PATH"
              done
              mkdir -p .cache/texmf-var
              env TEXMFHOME=.cache TEXMFVAR=.cache/texmf-var \
                latexmk -interaction=nonstopmode -pdf -xelatex -jobname='%A-en'\
                cv.tex
              env TEXMFHOME=.cache TEXMFVAR=.cache/texmf-var \
                latexmk -interaction=nonstopmode -pdf -xelatex -jobname='%A-cn'\
                cv.tex
                pdfunite cv-{en,cn}.pdf cv-merged.pdf
            '';
            installPhase = ''
              mkdir -p $out
              cp cv-*.pdf $out/
            '';
          };
        });
        devShells = forEachSupportedSystem ({ pkgs, fonts, deps }: {
          default = pkgs.mkShell {
            packages = [ deps ];
            FONTCONFIG_FILE = pkgs.makeFontsConf { fontDirectories = fonts; };
            # OSFONTDIR = builtins.concatStringsSep "//:" fonts;
          };
        });
      };
}
