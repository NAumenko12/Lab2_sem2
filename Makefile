.PHONY: all clean run1 run2 run3 run-all

all: compile-cpp compile-go1 compile-py compile-js compile-cpp2 compile-go2 compile-swift compile-kotlin compile-cpp3 compile-go3 compile-java compile-elixir

compile-cpp:
	g++ zad1/zadanie1.cpp -o zad1/zadanie1_cpp

compile-go1:
	cd zad1/go1 && go build -o zadanie1_go zadani1g.go
	mv zad1/go1/zadanie1_go zad1/

compile-py:
	@echo "Python script: zad1/zadanie.py"

compile-js:
	@echo "JavaScript script: zad1/zadanie1.js"

compile-cpp2:
	g++ zad2/zadanie2.cpp -o zad2/zadanie2_cpp

compile-go2:
	cd zad2/go2 && go build -o zadanie2_go zadanie2.go
	mv zad2/go2/zadanie2_go zad2/

compile-swift:
	- swiftc -o zad2/zadanie_swift zad2/zadanie.swift 2>/dev/null || true

compile-kotlin:
	kotlinc zad2/zadanie2.kt -include-runtime -d zad2/zadanie2_kt.jar

compile-cpp3:
	g++ zad3/zadanie3.cpp -o zad3/zadanie3_cpp

compile-go3:
	cd zad3/go3 && go build -o zadanie3_go zadgo3.go
	mv zad3/go3/zadanie3_go zad3/

compile-java:
	javac zad3/Main.java -d zad3/

compile-elixir:
	@echo "Elixir script: zad3/zadanie3.ex"

run1:
	@echo "\n=== ЗАДАНИЕ 1 (минимальная подстрока) ==="
	@echo "C++:" && ./zad1/zadanie1_cpp
	@echo "Go:" && ./zad1/zadanie1_go
	@echo "Python:" && python3 zad1/zadanie.py
	@echo "JavaScript:" && node zad1/zadanie1.js

run2:
	@echo "\n=== ЗАДАНИЕ 2 (офис) ==="
	@echo "C++:" && ./zad2/zadanie2_cpp
	@echo "Go:" && ./zad2/zadanie2_go
	@echo "Swift:" && ./zad2/zadanie_swift
	@echo "Kotlin:" && java -jar zad2/zadanie2_kt.jar

run3:
	@echo "\n=== ЗАДАНИЕ 3 (числа, равные предыдущему) ==="
	@echo "C++:" && ./zad3/zadanie3_cpp
	@echo "Go:" && ./zad3/zadanie3_go
	@echo "Java:" && java -cp zad3/ Main
	@echo "Elixir:" && elixir zad3/zadanie3.ex

run-all: run1 run2 run3

clean:
	rm -f zad1/zadanie1_cpp zad1/zadanie1_go
	rm -f zad2/zadanie2_cpp zad2/zadanie2_go zad2/zadanie2_swift zad2/zadanie2_kt.jar
	rm -f zad3/zadanie3_cpp zad3/zadanie3_go
	rm -rf zad3/*.class zad3/Main.class
	@echo "Очистка завершена"