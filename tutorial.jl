println("Hello, World!")
# ctrl + enter -> wykonaj linię kodu
# alt + enter -> wykonaj komórkę kodu
# using CairoMakie, LinearAlgebr

## sterowanie przepływem:
x = 1.5
x+1 == 2.5 ? "prawda" : "fałsz"
x^2 == 3.1 ? "prawda" : "fałsz"

## pętla if
a = 1
@show a

## while\
i = 0
while i< 10
    @show i
    i += 1
end

## for -> break, continue, range, start:krok:stop
b = 1
for i in 1:10
    b +=1
    @show i, b
end

## enumerate, zip

## collect
A = 1:100
X = collect(A)

## funkcja
function transform3(f::Function)
    f(3)
end
transform3(x -> x^2) # funkcja anonimowa!

## domknięcie
function make_fancy_generator(f::Function)::Function
    x = 0.0
    return function (krok = 1.0)
        x += f(krok)
        return x
    end
end
g = make_fancy_generator(x -> sqrt(x))
@show g()
@show g()
for i = 1:10
    @show g(i)
end
dump(g) # tutaj mam tą ostatnią wartość, fajne xd

## tablica
tab = [1, 2, 3, "tekst"]
@show tab

##
a = []
push!(a,3)
last = pop!(a)
append!(a, [4, 5])
length(a)
@show a

##
zeros(4)
zeros(ComplexF64, 6, 4)
zeros(ComplexF64, (5, 10))
 
size(zeros(4, 8))
length(zeros(4, 8))
reshape(zeros(ComplexF64, 4, 8), 2, 16)
 
eltype(zeros(4, 8))
eltype(zeros(ComplexF64, 4, 8))
 
ones(4)
ones(ComplexF64, 4, 4)
ones(ComplexF64, (4, 4))
 
rand(4)
rand(ComplexF64, 4, 4)
rand(ComplexF64, (4, 4))
 
randn(4)
randn(ComplexF64, 4, 4)
randn(ComplexF64, (4, 4))

## przydatne
N, R = 10, 3
a, b, c, d = 1.9, 2.7, 3.5, 4.3
z = 1.0 + im*1.0
T = [a, b, c, d]
 
# Operacja na liczbach całkowitych
div(N, R)    # Dzielenie całkowite
rem(N, R)    # Reszta z dzielenia
divrem(N, R) # Dzielenie i reszta za jednym razem
 
# Podstawowe funkcje matematyczne
sqrt(d)  # Pierwiastek kwadratowy liczby x
exp(d)   # Eksponenta liczy x
cos(d)   # Cosinus kąta x (rad)
sin(d)   # Sinus kąta x (rad)
sinc(d)  # Funkcja sinc z liczby x
log(d)   # Logarytm naturalny z liczby x
log2(d)  # Logarytm binarny z liczby x
log10(d) # Logarytm dziesiętny z liczby x
 
abs(z)   # Moduł liczby zespolone
angle(z) # Argument liczby zespolonej
real(z)  # Część rzeczywista
imag(z)  # Część urojona
 
floor(Int, d) # Podłoga z liczby x (rzutowany na typ Int)
ceil(Int, d)  # Sufit z liczby x (rzutowany na typ Int)
 
max(a, b, c, d) # Wartość maksymalna argumentów
min(a, b, c, d) # Wartość minimalna argumentów
 
# Funkcje dla tablic
length(T)   # Ilość elementów w tablicy
size(T)     # Wymiar tablicy
sum(T)      # Suma wszystkich elementów
maximum(T)  # Maksymalna wartość w tablicy
minimum(T)  # Minimalna wartość w tablicy
argmax(T)   # Indeks maksymalne wartość w tablicy
argmin(T)   # Indeks minimalne wartość w tablicy
 
# Alokowanie tablicy o zadanym wymiarze
# Wymiarów można dodawać w opór. Wymiar można alternatywnie podać w postaci krotki.
# Domyślnie typ Float64, można też podać inny jako pierwszy argument.
zeros(N)                    # Wektor o długości N o typie Float64
zeros(N, N)                 # Macierz o wymiarze N x N o typie Float64
zeros(N, N, N)              # Tablica o wymiarze N x N x N o typie Float64
zeros(ComplexF64, N)        # Wektor o długości N o typie ComplexF64
zeros(ComplexF64, N, N)     # Macierz o wymiarze N x N o typie ComplexF64
zeros(ComplexF64, N, N, N)  # Tablica o wymiarze N x N x N o typie ComplexF64
 
# Iterator
start, krok, stop = 10, 0.1, 100
start:stop
start:krok:stop
range(start, stop; step=krok)
range(start, stop; length=100)

## wypisywanie
a = "to jest"
b = "przykład"
x = randn(4, 4)
 
# Wypisz podane wartości
print(a, b, x)
 
# Wypisz podane wartości ze znakiem nowej linii na końcu
println(a, b, x)
 
# Wyświetl ładnie wartość (tylko jeden argument)
display(x)
 
# Można też korzystać z makra @show
@show a b x

## wykres :o
using CairoMakie
 
fs = 100
dt = 1/fs
t_1, t_2 = 0.0, 1.0
t = range(t_1, t_2; step=dt)
x = sin.(2*pi*10*t)
 
lines(t, x)