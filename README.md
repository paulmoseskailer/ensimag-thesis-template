# Ensimag thesis-template-typst

This is a [typst](https://typst.app/) template for an MoSIG M2 internship report.
It was itself generated from the [CIT TUM thesis template](https://github.com/ls1intum/thesis-template-typst) and aims to resemble the [LaTeX template](https://mosig.imag.fr/ProgramEn/ProjectOverview) provided on the [MoSIG website](https://mosig.imag.fr/ProgramEn/ProjectOverview) as closely as possible.

I am sure it is full of inaccuracies (compared to the LaTeX template) and riddled with bad typst practices, so use at your own discretion.

## Usage
### Set thesis metadata 
Fill in your thesis details in the [`metadata.typ`](/metadata.typ) file: 
* Degree (Bachelor or Master)
* Your study program
* English and German title
* Advisor and supervisor
* Your name (without e-mail address or matriculation number)
* The start and submission date

### Write your thesis
For the actual content of your thesis, there is a dedicated folder named [`/content`](/content) which includes all the chapters and sections of your thesis. This applies for the proposal as well as the thesis (see [`/content/proposal`](/content/proposal) for proposal content). 
You can add or remove chapters as needed (adapt the [`thesis.typ`](/thesis.typ) with the `#include(...)` accordingly).
If you need to customize the layout of the template, you can do so by modifying the corresponding file in the [`layout`](/layout) directory.

### Build PDFs locally 
Once you have installed Typst, you can use it like this:
```sh
# Creates `thesis.pdf` in working directory.
typst compile thesis.typ

# Creates `proposal.pdf` in working directory.
typst compile proposal.typ

# Creates PDF file at the desired path.
typst compile thesis.typ path/to/output.pdf
```

You can also watch source files and automatically recompile on changes. This is
faster than compiling from scratch each time because Typst has incremental
compilation.
```sh
# Watches source files and recompiles on changes.
typst watch thesis.typ
```

## Working with the Typst Web Editor
If you prefer an integrated IDE-like experience with autocompletion and instant preview, the Typst web editor allows you to import files directly into a new or existing document. Here's how you can do this:

1. Navigate to the [Typst Web Editor](https://typst.app/).
2. Create a new blank document.
3. Click on "File" on the top left menu, then "Upload File".
4. Select all .typ and .bib files along with the figures provided in this template repository.

**Note:** You can select multiple files to import. The editor will import and arrange all the files accordingly. Always ensure you have all the necessary .typ, .bib, and figures files you need for your document.

## Working with VS Code
If you prefer to have a more integrated experience with your favorite code editor, you can use the Typst VS Code extension. The extension provides syntax highlighting, autocompletion, and error checking for Typst files. You can install the extension from the [VS Code Marketplace](https://marketplace.visualstudio.com/items?itemName=nvarner.typst-lsp).

1. Open your project in VS Code
2. Set the correct file (`thesis.typ` or `proposal.typ`) as the main file. This can be done by opening the respective file and running the command `Typst: Pin the main file to the currently opened document`. Just hit `CMD + Shift + P` and search for the command.


---
## Further Resources

- [Typst Documentation](https://typst.app/docs/)
- [Typst Guide for LaTeX Users](https://typst.app/docs/guides/guide-for-latex-users/)
- [Typst VS Code Extension (inofficial)](https://marketplace.visualstudio.com/items?itemName=nvarner.typst-lsp)
