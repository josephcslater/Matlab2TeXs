function texstr = matrix2tex(a, format, env)
% MATRIX2TEX LaTeX string for a (possibly complex) matrix.
%   TEXSTR = MATRIX2TEX(A,FORMAT,ENV) returns the LaTeX for matrix A.
%   With no output argument the result is printed to the command window.
%
%   A      is the matrix.
%   FORMAT (optional) is an sprintf format applied to each number,
%          default '%5.3f'. Examples:
%            %d  integer      %e  exponential    %f  fixed point
%            %g  compact of %e or %f (insignificant zeros are dropped)
%          Width and precision may be given, e.g. '%8.3g'.
%   ENV    (optional) LaTeX matrix environment, default 'bmatrix'. Use ''
%          to emit only the rows (no \begin/\end).
%
%   Example:
%     a = rand(4,2);
%     matrix2tex(a)
%     matrix2tex(a,'%8.3g')
%     matrix2tex(a*1000,'%8.3e','pmatrix')

% Copyright Joseph C. Slater, 2005
% Updated 7/10/09 to handle complex numbers

if nargin < 2 || isempty(format)
  format = '%5.3f';
end
if nargin < 3
  env = 'bmatrix';
end

nl = sprintf('\n');
[m, n] = size(a);
rows = cell(m, 1);
for i = 1:m
  entries = cell(1, n);
  for j = 1:n
    entries{j} = entry2tex(a(i,j), format);
  end
  rows{i} = join_(entries, '&');
end
body = join_(rows, ['\\' nl]);

if isempty(env)
  texstr = [body nl];
else
  texstr = ['\begin{' env '}' nl body nl '\end{' env '}' nl];
end

if nargout == 0
  fprintf('%s', texstr);
  clear texstr
end
end

function s = entry2tex(x, format)
% Format one real or complex number.
re = real(x);
im = imag(x);
s = '';
if re ~= 0 || im == 0
  s = sprintf(format, re);
end
if im ~= 0
  if im > 0 && re ~= 0
    s = [s '+'];
  end
  s = [s sprintf(format, im) 'i'];
end
end

function s = join_(c, delim)
% Portable strjoin (older MATLAB/Octave lack it).
s = '';
for k = 1:numel(c)
  if k > 1
    s = [s delim];
  end
  s = [s c{k}];
end
end
