package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
)

func main() {
	in := bufio.NewReader(os.Stdin)
	var n int
	fmt.Fscan(in, &n)
	zayvki := zapolTime(n, in)
	SortZayavki(zayvki)
	nomera := CountMaxZayavki(zayvki)
	printNomera(nomera)
}

func zapolTime(n int, in *bufio.Reader) [][3]int {
	zayvki := make([][3]int, 0, n)
	for i := 0; i < n; i++ {
		var startTime, endTime int
		fmt.Fscan(in, &startTime, &endTime)
		zayvki = append(zayvki, [3]int{endTime, startTime, i + 1})
	}
	return zayvki
}

func lessZayavka(firstZ, secondZ [3]int) bool {
	if firstZ[0] != secondZ[0] {
		return firstZ[0] < secondZ[0]
	}
	if firstZ[1] != secondZ[1] {
		return firstZ[1] < secondZ[1]
	}
	return firstZ[2] < secondZ[2]
}

func SortZayavki(zayvki [][3]int) {
	sort.Slice(zayvki, func(i, j int) bool {
		return lessZayavka(zayvki[i], zayvki[j])
	})
}

func CountMaxZayavki(zayvki [][3]int) []int {
	nomera := make([]int, 0)
	lEnd := -1
	for i := 0; i < len(zayvki); i++ {
		end := zayvki[i][0]
		start := zayvki[i][1]
		index := zayvki[i][2]
		if start >= lEnd {
			nomera = append(nomera, index)
			lEnd = end
		}
	}
	sort.Ints(nomera)
	return nomera
}

func printNomera(nomera []int) {
	fmt.Printf("Результат: %d, ", len(nomera))
	for _, x := range nomera {
		fmt.Printf("%d ", x)
	}
	fmt.Println()
}
