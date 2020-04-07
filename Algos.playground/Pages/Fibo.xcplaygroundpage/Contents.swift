//: [К началу недели](Week_2)
/*:
 # Алгоритм поиска числа Фибоначчи
## Последователоьность Фибоначчи:
 - F(n) = F(n-1) + F(n-2),
 - F(0) = 0,
 - F(1) = 1
 ### Нативная реализация - рекурсивная
 Очень долгое вычисление дальше 20 числа, так как постоянно вызывается одно и то же.
 */

func fibRecursive(n: Int) -> Int {
    if n <= 1 {
        return n
    } else {
        return fibRecursive(n: n-1) + fibRecursive(n: n-1)
    }
}

fibRecursive(n: 3)
fibRecursive(n: 10)
//fibRecursive(n: 15)
//fibRecursive(n: 30) //Не вычислилось за минуту


/*:
 ### Эффективный алгоритм
 Использовать предыдущие вычисления для продолжения
 */

func fibEffective(n: Int) -> Int {
    var arr = [0, 1]
    
    for i in 2...n {
        arr.append(arr[i-1] + arr[i-2])
    }
    
    return arr[arr.count-1]
}

fibEffective(n: 3)
fibEffective(n: 10)
fibEffective(n: 35)

//: [GCD](@next)
