# Spheryst

[Typst](https://typst.app/) template designed for writing physics students homework. At the
moment, only the `Homework` document type is fully supported. Support for
Report and Slide formats is planned.

> Typst is LaTeX… but for the cool kids.
> I started using Typst because the language feels far more intuitive and enjoyable than LaTeX while still being powerful (+rust btw). Compile time is a bonus.

If you prefer LaTeX or want more complete academic templates, check out my other repositories:

- [LaTeX Homework Template](https://github.com/firman-qs/template-repository)
- [LaTeX Book Template](https://github.com/firman-qs/LaTex-book-template)

These templates are more mature and feature-complete, while this Typst template is my newer, simpler, and more intuitive alternative for daily physics coursework.

---

This template provide:
- Clean homework layout with title block
- English & Indonesian language support
- Automatic equation, figure, and table labeling (with the help of [i-figured](https://typst.app/universe/package/i-figured/) and [equate](https://typst.app/universe/package/equate/))
- Optional numbered headings
- Physics-friendly setup with useful external packages (by [physica](https://typst.app/universe/package/physica/))
- *TODO:* Custom macro for common tasks

## Basic Usage

To use this template, simply clone the repository and import `lib.typ` to your
main typst file.

```typst
#import "./lib.typ": * // import the template, that is the lib.typ file

#show: template.with(
  author: [Ezalor],
  title: [Homework From My Teacher],
  course: [The Name of The Course This HW Belong To],
  doc_type: DocType.Homework,
  doc_lang: Lang.English,
  num_heading: true,
  // for other available configuraion see the lib.typ
)

Your document text here
```

## Currently available configurations

| Parameter     | Description              | Default                 |
| ------------- | ------------------------ | ----------------------- |
| `title`       | Document title           | "Title of The Document" |
| `author`      | Author name              | "Ezalor"                |
| `id`          | Student/author ID        | "875012378123"          |
| `offering`    | Course offering/term     | "SU57"                  |
| `course`      | Course name              | `none`                  |
| `num_heading` | Enable numbered headings | `false`                 |
| `doc_lang`    | Document language        | `Lang.English`          |
| `doc_type`    | Document type            | `DocType.Homework`      |

### Supported Document Types

- `DocType.Homework`
- `DocType.Report`   // not implemented yet
- `DocType.Slide`    // not implemented yet

Currently, only Homework has a complete layout.

### Language Support

- `Lang.English`
- `Lang.Indonesia`

This affects labels such as:

- Equation → Eq. / Persamaan
- Figure → Fig. / Gambar
- Table → Table / Tabel


> For all available configuration options, see `lib.typ`.

---

## External Typst Package Used

This template depend on several external packages, take a look at

- [typst.app/universe/package/equate/](https://typst.app/universe/package/equate/)
- [typst.app/universe/package/i-figured/](https://typst.app/universe/package/i-figured/)
- [typst.app/universe/package/physica/](https://typst.app/universe/package/physica/)
