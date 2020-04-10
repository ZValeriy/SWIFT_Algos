//: [Previous](@previous)     
//: [К началу недели](Week_2)

/*:
 # Задачи 2-ой недели специализации
 
 ## Задача 2. Последняя цифра большого числа Фибоначчи.
 Необходимо найти последнюю цифру н-го числа Фибоначчи.
 Обычный алогоритм здесь не подходит, потому что числа растут очень быстро, поэтому большой порядковый номер не поместится в Int.
 
 ### Решение.
 Можно хранить последние цифры всех вычислений, тогда нам не нужны будут первые значащие разряды.
 - Примечание. В данном решении сокращено использование дополнительной памяти. 
 */

func fibLastDigit(n: Int) -> Int {
    var arr = [0, 1]
    
    for _ in 2...n {
        let newValue = (arr[0] + arr[1]) % 10
        arr[0] = arr[1]
        arr[1] = newValue
    }
    
    return arr[1]
}
fibLastDigit(n: 200)
fibLastDigit(n: 3)
fibLastDigit(n: 331)


/*:
## Задача 4. Наименьшее общее кратное.
Нужно найти НОК двух чисел a и b.

### Решение.
НОК можно найти, найдя произведение двух чисел и поделив его на их НОД.
*/

func gcdFast(a: Int, b: Int) -> Int {
    var aIn = a
    var bIn = b
    
    while (bIn != 0) {
        aIn %= bIn
        
        let tmp = aIn
        aIn = bIn
        bIn = tmp
    }
    return aIn
}

func leastCommonMult(a: Int, b: Int) -> Int {
    let gcd = gcdFast(a: a, b: b)
    return a * b / gcd
}

leastCommonMult(a: 6, b: 8)
leastCommonMult(a: 761457, b: 614573)

/*:
## Задача 5. Найти остаток от деления числа Фибоначчи на число m.


### Решение.
Остатки от деления чисел Фибоначчи на какое-то число формируют периодичную последовательность, которая называется последовательностью Пизано. Последовательность Пизано всегда начинается как 0,1. То есть необходимо найти период этой последовательности.
Период Пизано не больше, чем m*6
*/

func pizano(m: Int) -> [Int] {
    var pizano = [0, 1]
    
    for i in 2..<m*6 {
        let newValue = (pizano[i-1] + pizano[i-2]) % m
        
        pizano.append(newValue)
        
        if pizano[pizano.count - 1] == 1 && pizano[pizano.count - 2] == 0 {
            break
        }
    }
    
    return Array(pizano[0..<pizano.count-2])
}

func fibMod(n: Int, m: Int) -> Int {
    let pizanoSequence = pizano(m: m)
    
    return pizanoSequence[n % pizanoSequence.count]
}

fibMod(n: 239, m: 1000)
fibMod(n: 2816213588, m: 239)

/*:
## Задача 6. Найти последнюю цифру суммы n чисел Фибоначчи.


### Решение.
Можно воспользоваться предыдущей задачей. С помощью нее мы быстро найдем последнюю цифру n-го числа Фибоначчи
*/


func fibEffective(n: Int) -> [Int] {
    var arr = [0, 1]
    
    for i in 2...n {
        arr.append(arr[i-1] + arr[i-2])
    }
    
    return arr
}

func sumFib(n: Int) -> Int {
    let arr = fibEffective(n: n)
    var sum = 0
    for i in arr {
        sum += i % 10
    }
    
    return sum % 10
}

for i in 2...50 {
    print(sumFib(n: i))
}




func backspaceCompare(_ S: String, _ T: String) -> Bool {
    var st1 = [Character]()
    var st2 = [Character]()
    
    for i in S {
        if i=="#" {
            if st1.count != 0 {
                st1.removeLast()
            }
        } else {
            st1.append(i)
        }
    }
    
    for i in T {
        if i=="#" {
             if st2.count != 0 {
                st2.removeLast()
            }
        } else {
            st2.append(i)
        }
    }
    
    return st1 == st2
}

backspaceCompare("a#c", "b")
backspaceCompare("a##c", "#a#c")
backspaceCompare("ab##", "c#d#")
backspaceCompare("ab#c", "ad#c")

//: [Next](@next)
