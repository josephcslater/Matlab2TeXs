function test_matrix2tex
% Run from this folder with: addpath('..'); test_matrix2tex
nl = sprintf('\n');

assert(strcmp(matrix2tex([1 2;3 4],'%d'), ...
  ['\begin{bmatrix}' nl '1&2\\' nl '3&4' nl '\end{bmatrix}' nl]));
assert(strcmp(matrix2tex([1 2],'%d',''), ['1&2' nl]));
assert(strcmp(matrix2tex(5,'%d','pmatrix'), ...
  ['\begin{pmatrix}' nl '5' nl '\end{pmatrix}' nl]));
assert(strcmp(matrix2tex(1.5), ...
  ['\begin{bmatrix}' nl '1.500' nl '\end{bmatrix}' nl]));
assert(strcmp(matrix2tex([1+2i 1-2i 3i 4],'%d',''), ...
  ['1+2i&1-2i&3i&4' nl]));
disp('test_matrix2tex passed');
end
