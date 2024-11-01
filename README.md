# My LaTeX CV Template with YAML Data Source

This repository contains an easy-to-use and fully customizable LaTeX Curriculum Vitae (CV) template powered by YAML data source. By structuring your data in the YAML format, you can seamlessly generate professional-looking CVs as LaTeX source files, which can then be converted to PDFs.


## Features

- Readable and easily customizable input file format in YAML.
- Abstraction between content and style.
- Well-structured LaTeX template to generate professional-looking CVs.
- Automatic generation of LaTeX source file followed by conversion to PDF.


## Installation

### Manually
- Clone this repository to your local machine.
- You need a LaTeX environment installed on your computer to compile the tex files (e.g., TeXLive, MiKTeX).
- You need a mushtache cli from mustache-go
- execute `dev.sh`
### Nix Flake
- Clone this repository to your local machine.
- execute `nix build`;
- or execute `dev.sh` inside a `nix develop` shell

## How to Use

1. Add your personal information, experience, education, skills, etc., in the `data.yaml` file.
2. Run `dev.sh`, which will read data from the YAML file and generate PDF files in `dist`

## Customization

You can fully customize your CV by modifying the `templates/*.tpl` file. This LaTeX file includes modular sections like Experience, Skills, and so forth, which you can manipulate according to your preferences and needs.


## Troubleshoot & Help

Feel free to create an issue or make a pull request if you have suggestions for improvements, find errors, or need help.


## License

This project is licensed under the Apache License - see the [`LICENSE.md`](LICENSE.md) file for details.
