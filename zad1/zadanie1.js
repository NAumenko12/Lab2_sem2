async function main() {
    const prompt = require('prompt-sync')();
    const stroka = prompt("Введите строку stroka: ");
    const podstroka = prompt("Введите строку podstroka: ");
    const res = minSubstring(stroka, podstroka);
    console.log(res ? "Результат: " + res : "Не найдено");
}

function podhodit(sub, podstroka) {
    const need = Array(128).fill(0);
    for (let c of podstroka) need[c.charCodeAt(0)]++;
    for (let c of sub) need[c.charCodeAt(0)]--;
    return need.every(v => v <= 0);
}

function minSubstring(stroka, podstroka) {
    let result = "";
    for (let i = 0; i < stroka.length; i++) {
        for (let j = i; j < stroka.length; j++) {
            const sub = stroka.substring(i, j + 1);
            if (podhodit(sub, podstroka)) {
                if (!result || sub.length < result.length) result = sub;
            }
        }
    }
    return result;
}

main();