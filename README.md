# Spheryst

This is my personal typst template as a physics student. Currently, only
homework document type were supported.

---

## Basic Usage

To use this template, simply clone the repository and import `lib.typ` to your
main typst file.

```typst
#import "./lib.typ": * // import the template, that is the lib.typ file

#show: template.with(
  title: [Tugas Kuliah Pertemuan ke-1],
  course: [The Name of The Course This HW Belong To],
  doc_type: DocType.Homework,
  num_heading: true,
  // for other available configuraion see the lib.typ
)

Your document text here
```

For more configuration feel free to peek `lib.typ`.

---

## External Typst Package Used

This template depend on several external packages, take a look at

- [typst.app/universe/package/equate/](https://typst.app/universe/package/equate/)
- [typst.app/universe/package/i-figured/](https://typst.app/universe/package/i-figured/)
- [typst.app/universe/package/physica/](https://typst.app/universe/package/physica/)
