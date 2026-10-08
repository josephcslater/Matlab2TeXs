function test_poly2tex
% Run from this folder with: addpath('..'); test_poly2tex
assert(strcmp(poly2tex([1 -3 0 2],'s'), 's^{3} - 3 s^{2} + 2'));
assert(strcmp(poly2tex([2 1],'t',true), '2 t + 1 = 0'));
assert(strcmp(poly2tex([-1 0 1]), '-x^{2} + 1'));
assert(strcmp(poly2tex([1 -1],'z'), 'z - 1'));
assert(strcmp(poly2tex(7), '7'));
assert(strcmp(poly2tex(0), '0'));
assert(strcmp(poly2tex([0 0 4]), '4'));
assert(strcmp(poly2tex([1 0],'s',true), 's = 0'));
disp('test_poly2tex passed');
end
