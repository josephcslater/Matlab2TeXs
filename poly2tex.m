function texstr = poly2tex(poly, var, iseqn)
% POLY2TEX LaTeX string for a polynomial.
%   TEXSTR = POLY2TEX(POLY,VAR,ISEQN) returns the LaTeX for a polynomial.
%   POLY  is the polynomial in MATLAB/Octave form (highest power first).
%   VAR   (optional) is the variable name, default 'x'.
%   ISEQN (optional) if true, appends ' = 0' to make an equation.
%         Default false.
%
%   Zero terms are omitted, coefficients of 1 are implicit, and negative
%   coefficients are written with a minus sign. Complex coefficients are
%   wrapped in parentheses.
%
%   Example:
%     poly2tex([1 -3 0 2],'s')       returns  s^{3} - 3 s^{2} + 2
%     poly2tex([2 1],'t',true)       returns  2 t + 1 = 0

% Copyright Joseph C. Slater, 2002

if nargin < 2 || isempty(var)
  var = 'x';
end
if nargin < 3 || isempty(iseqn)
  iseqn = false;
end

n = numel(poly) - 1;
texstr = '';

for k = 1:numel(poly)
  c = poly(k);
  if c == 0
    continue
  end
  p = n - k + 1;

  if isreal(c)
    neg = c < 0;
    mag = abs(c);
    cstr = num2str(mag);
    implicit = (mag == 1) && p > 0;
  else
    neg = false;
    cstr = ['(' num2str(c) ')'];
    implicit = false;
  end

  if p == 0
    term = cstr;
  else
    if implicit
      term = var;
    else
      term = [cstr ' ' var];
    end
    if p > 1
      term = [term '^{' num2str(p) '}'];
    end
  end

  if isempty(texstr)
    if neg
      texstr = ['-' term];
    else
      texstr = term;
    end
  elseif neg
    texstr = [texstr ' - ' term];
  else
    texstr = [texstr ' + ' term];
  end
end

if isempty(texstr)
  texstr = '0';
end
if iseqn
  texstr = [texstr ' = 0'];
end
end
