package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	scanner := bufio.NewScanner(os.Stdin)
	fmt.Print("Введите строку Stroka: ")
	scanner.Scan()
	S := scanner.Text()
	fmt.Print("Введите строку Podstroka:  ")
	scanner.Scan()
	T := scanner.Text()
	res := minSubstring(S, T)
	if res != "" {
		fmt.Println("Результат:", res)
	} else {
		fmt.Println("Не найдено")
	}
}

func podhodit(stroka, podstroka string) bool {
	need := [128]int{}
	for i := 0; i < len(podstroka); i++ {
		need[podstroka[i]]++
	}
	for i := 0; i < len(stroka); i++ {
		need[stroka[i]]--
	}
	for i := 0; i < 128; i++ {
		if need[i] > 0 {
			return false
		}
	}
	return true
}
func minSubstring(stroka, podstroka string) string {
	result := ""
	for i := 0; i < len(stroka); i++ {
		for j := i; j < len(stroka); j++ {
			sub := stroka[i : j+1]
			if podhodit(sub, podstroka) {
				if result == "" || len(sub) < len(result) {
					result = sub
				}
			}
		}
	}
	return result
}
