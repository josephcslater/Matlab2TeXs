# Changelog

## Unreleased

### Added
- `LICENSE` (MIT).
- `tests/test_poly2tex.m` and `tests/test_matrix2tex.m`.
- `matrix2tex`: optional third argument selecting the matrix environment
  (default `bmatrix`, `''` for rows only).
- README usage examples; `.gitignore`.

### Changed
- `matrix2tex` now returns the LaTeX string and prints only when called with
  no output argument.
- `matrix2tex` output is wrapped in `\begin{bmatrix}...\end{bmatrix}` by
  default (previously rows only).
- `poly2tex` omits zero terms, drops unit coefficients, and writes negative
  coefficients with a minus sign.
- Replaced `|` and `&` with `||` and `&&` in conditions; unified indentation.
- Corrected help text (matrix, not polynomial; `FORMAT`, not `PLACES`).

### Fixed
- `poly2tex` errors on constant polynomials and when called with one argument.
- `matrix2tex` mangled backslashes and `%` by passing output through
  `printf`/`sprintf` as a format string; removed the `exist('ver')` check.
- Negative imaginary parts in `matrix2tex` are formatted correctly.
