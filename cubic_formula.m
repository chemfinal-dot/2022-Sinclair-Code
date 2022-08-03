function x = cubic_formula(c,s,a)
%CUBIC_FORMULA Summary of this function goes here
%   c = fitting parameter, for two generators c = 2 works well
%   s = number of generators
%   a = constant parameter for alpha, usually a=1 or 1/(2*s)


%ignore this stuff
%q1 = 128 *a^6 *c^6 - 1024 *a^6 *s^3 *c^6 + 1536 *a^6 *s^2 *c^6 - 768 *a^6 *s *c^6 + 432 *a^4 *c^4 + 3840 *a^4 *s^4 *c^4 - 8448 *a^4 *s^3 *c^4 + 7296 *a^4 *s^2 *c^4 - 2880 *a^4 *s *c^4 + 1536 *a^2 *s^5 *c^2 - 1920 *a^2 *s^4 *c^2 + 576 *a^2 *s^3 *c^2 + 128 *s^6;
%q2 = (48 *(2 *a^2 *s - a^2)* (-a^2 *c^4 + 2 *a^2 *s* c^4 + s* c^2) - 16 *(-2 *a^2 *c^2 + 4 *a^2 *s *c^2 + s^2)^2);

%x = -sqrt((-2 *a^2 *c^2 + 4 *a^2 *s *c^2 + s^2)/(3 *(2 *a^2 *s - a^2)) + (q1 + sqrt(4 *(q2)^3 + (q1)^2))^(1/3)/(12 *2^(1/3)* (2 *a^2 *s - a^2)) - q2/(6 *2^(2/3) *(2 *a^2 *s - a^2)* (q1 + sqrt(4 *q2^3 + (q1)^2))^(1/3)));
%x = sqrt((-2 *a^2 *c^2 + 4 *a^2 *s *c^2 + s^2)/(3 *(2 *a^2 *s - a^2)) + (q1 + sqrt(4 *q2^3 + (q1)^2))^(1/3)/(12 *2^(1/3) *(2 *a^2 *s - a^2)) - q2/(6 *2^(2/3) *(2 *a^2 *s - a^2) *(q1 + sqrt(4 *q2^3 + (q1)^2))^(1/3)));

r = [(16*a^2*s^2 - 32*a^2*s^3); 0; (-32*a^2*c^2*s^2 + 64*a^2*c^2*s^3 + 16*s^4); 0; (16*a^2*c^4*s^2 - 16*c^2*s^3 - 32*a^2*c^4*s^3); 0; (4*c^4*s^2)];
X = roots(r);

x = X(6);

end
