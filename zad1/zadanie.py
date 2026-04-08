from collections import Counter

def podhodit(stroka: str, podstroka: str) -> bool:
    countNeed = Counter(podstroka)
    countHave = Counter(stroka)
    for ch in countNeed:
        if countHave[ch] < countNeed[ch]:
            return False
    return True

def minPodstroka(stroka: str, podstroka: str) -> str:
    n = len(stroka)
    result = ""
    for i in range(n):
        for j in range(i, n):
            pod = stroka[i:j+1]
            if podhodit(pod, podstroka):
                if not result or len(pod) < len(result):
                    result = pod
    return result

def main():
    stroka = input("Введите строку\n")
    podstroka = input("Введите подстроку\n")
    res = minPodstroka(stroka, podstroka)
    if res:
        print("Результат:", res)
    else:
        print("Не найдено")

if __name__ == "__main__":
    main()