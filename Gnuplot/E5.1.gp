set xlabel 'natężenie prądu I[A]'
set ylabel 'Siła działająca na fragment przewodnika F[N]'
set datafile separator ","
set grid

# używane funkcje
F(m) = abs(m_0 - m) * 9.815 /1000


# używanie metody najmniejszych kwadratów do uzyskania prostej a*x + b
f(x) = a*x + b
fit f(x) file every ::1 using 1:(F($2)) via a,b

plot file every ::1 using 1:(F($2)) with linespoint lc rgb "red" title '', f(x) title sprintf("%f * I+(%f)",a,b)
