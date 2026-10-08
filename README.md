# Matlab2TeXs

Create LaTeX from MATLAB/Octave polynomials and matrices.

## Functions

### `poly2tex(poly, var, iseqn)`

```matlab
poly2tex([1 -3 0 2], 's')      % s^{3} - 3 s^{2} + 2
poly2tex([2 1], 't', true)     % 2 t + 1 = 0
```

Zero terms are dropped, unit coefficients are implicit, negatives use a minus
sign. `var` defaults to `'x'`; `iseqn` defaults to `false`.

### `matrix2tex(a, format, env)`

```matlab
matrix2tex([1 2; 3 4], '%d')
% \begin{bmatrix}
% 1&2\\
% 3&4
% \end{bmatrix}
```

Handles complex entries. `format` is an `sprintf` format (default `'%5.3f'`);
`env` is the matrix environment (default `'bmatrix'`, `''` for rows only).
With no output argument it prints; otherwise it returns the string.

## Tests

```matlab
cd tests; addpath('..'); test_poly2tex; test_matrix2tex
```

## License

MIT; see [LICENSE](LICENSE).

## Related

MATLAB's Symbolic Toolbox provides `latex()` for symbolic expressions; these
functions work directly on numeric arrays without that toolbox.
