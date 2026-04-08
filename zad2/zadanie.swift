import Foundation

func main() {
    print("Введите N:", terminator: " ")
    if let line = readLine(), let n = Int(line), n > 0 {
        var zayvki = zapolTime(n: n)
        SortZayavki(&zayvki)
        let nomera = CountMaxZayavki(zayvki)
        printNomera(nomera)
    }
}


func lessZayavka(_ firstZ: [Int], _ secondZ: [Int]) -> Bool {
    if firstZ[0] != secondZ[0] {
        return firstZ[0] < secondZ[0]
    }
    if firstZ[1] != secondZ[1] {
        return firstZ[1] < secondZ[1]
    }
    return firstZ[2] < secondZ[2]
}
func zapolTime(n: Int) -> [[Int]] {
    var zayvki: [[Int]] = []
    for i in 1...n {
        let line = readLine() ?? ""
        if line.isEmpty {
            continue
        }
        let parts = line.split(separator: " ").map { Int($0) ?? 0 }
        if parts.count != 2 {
            continue
        }
        let start = parts[0]
        let end = parts[1]
        zayvki.append([end, start, i])
    }
    return zayvki
}
func SortZayavki(_ zayvki: inout [[Int]]) {
    zayvki.sort(by: lessZayavka)
}
func CountMaxZayavki(_ zayvki: [[Int]]) -> [Int] {
    var nomera: [Int] = []
    var lastEnd = -1
    for z in zayvki {
        let end = z[0]
        let start = z[1]
        let index = z[2]
        if start >= lastEnd {
            nomera.append(index)
            lastEnd = end
        }
    }
    nomera.sort()
    return nomera
}
func printNomera(_ nomera: [Int]) {
    print("Результат: \(nomera.count), ", terminator: "")
    for x in nomera {
        print("\(x) ", terminator: "")
    }
    print()
}
main()