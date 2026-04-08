import java.util.*

fun main() {
    print("Введите N: ")
    val line = readLine()
    val n = line?.toIntOrNull()
    if (n == null || n <= 0) {
        println("Не найдено")
        return
    }
    val zayvki = zapolTime(n)
    SortZayavki(zayvki)
    val nomera = CountMaxZayavki(zayvki)
    printNomera(nomera)
}

fun lessZayavka(firstZ: IntArray, secondZ: IntArray): Boolean {
    if (firstZ[0] != secondZ[0]){
        return firstZ[0] < secondZ[0]
    } 
    if (firstZ[1] != secondZ[1]){
        return firstZ[1] < secondZ[1]
    } 
    return firstZ[2] < secondZ[2]
}
fun zapolTime(n: Int): MutableList<IntArray> {
    val zayvki = mutableListOf<IntArray>()
    for (i in 1..n) {
        val line = readLine()?.trim() ?: continue
        if (line.isEmpty()) continue
        val parts = line.split(Regex("\\s+")).map { it.toInt() }
        if (parts.size != 2) continue
        val start = parts[0]
        val end = parts[1]
        zayvki.add(intArrayOf(end, start, i))
    }
    return zayvki
}
fun SortZayavki(zayvki: MutableList<IntArray>) {
    zayvki.sortWith(compareBy({ it[0] }, { it[1] }, { it[2] }))
}

fun CountMaxZayavki(zayvki: List<IntArray>): List<Int> {
    val nomera = mutableListOf<Int>()
    var lastEnd = -1
    for (z in zayvki) {
        val end = z[0]
        val start = z[1]
        val index = z[2]
        if (start >= lastEnd) {
            nomera.add(index)
            lastEnd = end
        }
    }
    nomera.sort()
    return nomera
}

fun printNomera(nomera: List<Int>) {
    print("Результат: ${nomera.size}, ")
    for (x in nomera) print("$x ")
    println()
}

