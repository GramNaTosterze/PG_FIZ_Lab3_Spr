set xlabel 'natężenie prądu $I_m$[A]'
set ylabel 'Wartość wektora indukcji pola magnetycznego B[T]'
set datafile separator ","
set grid

# używane funkcje
# B = F/(I*L)
F(m) = abs(m_0 - m) * 9.815 /1000
B(m, I) = F(m)/(0.1*I)

# używanie metody najmniejszych kwadratów do uzyskania prostej a*x + b
f(x) = a*x + b
fit f(x) file every ::1 using 3:(B($2, $1)) via a,b

plot file every ::1 using 3:(B($2, $1)) with linespoint lc rgb "red" title '', f(x) title sprintf("%f*$I_m$+%f",a,b)
