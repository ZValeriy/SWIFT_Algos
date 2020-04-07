//: [Previous](@previous)   
//: [К началу 2-ой недели](Week_2)

/*:
 # Наибольший общий делитель
 ## Наибольшее число, на которое делятся 2 числа
  GCD(10, 4)=2; GCD(45, 30)=15
 
 - ## Нативный алгоритм
    - Пройти по всем числам меньшего числа и если оба делятся и оно наибольшее - вернуть его
 */

func gcdNative(a: Int, b: Int) -> Int {
    let minItem = a < b ? a : b
    
    var gcd = 0
    for step in 1...minItem {
        if a % step == 0 && b % step == 0{
            gcd = step > gcd ? step : gcd
        }
    }
    
    return gcd
}

gcdNative(a: 35, b: 15)
gcdNative(a: 35, b: 70)

/*:
 - ## Эффективный алгоритм (рекурсивный)
    - Алгоритм Евклида.
 */

func gcdEuclidRecursive(a: Int, b: Int) -> Int {
    if b == 0 {
        return a
    }
    
    return gcdEuclidRecursive(a: b, b: a  % b)
}

gcdEuclidRecursive(a: 35, b: 70)

/*:
- ## Эффективный алгоритм (без рекурсии)
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
gcdFast(a: 25, b: 75)
gcdFast(a: 357, b: 234)

//: [O-Notation](@next)
