package main

import "fmt"

func main() {
	var n int
	fmt.Print("Введите N\n")
	fmt.Scan(&n)
	fmt.Print("Введите массив до N\n")
	massiv := zapolnenie(n)
	fmt.Print("Введенный массив\n")
	printVector(massiv)
	fmt.Print("\nКоличество элементов, равных предыдущему: ")
	fmt.Println(countElements(massiv))
}
func countElements(massiv []int) int {
	count := 0
	for i := 1; i < len(massiv); i++ {
		if massiv[i] == massiv[i-1] {
			count++
		}
	}
	return count
}

func zapolnenie(n int) []int {
	massiv := make([]int, 0, n)
	var numbers int
	for i := 0; i < n; i++ {
		fmt.Scan(&numbers)
		massiv = append(massiv, numbers)
	}
	return massiv
}

func printVector(massiv []int) {
	for i := 0; i < len(massiv); i++ {
		fmt.Print(massiv[i], " ")
	}
}
