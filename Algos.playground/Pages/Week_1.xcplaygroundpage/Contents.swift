//: [Назад](@previous)
/*:
## Задача нахождения максимального произведения чисел в массиве
 
 - **Ввод** - массив чисел
 - **Задача** - поиск максимального произведения двух чисел из массива
 - **Вывод** - максимальное произведение
 */
/*:
 ### Тривиальный алгоритм
 - **Cложность** - O(n^2)
 */

func maxPairwise(_ array: [Int]) -> Int {
    var multiply = 0
    
    for i in 0..<array.count {
        for j in i..<array.count {
            if array[i] * array[j] > multiply && i != j {
                multiply = array[i] * array[j]
                print(multiply)
            }
        }
    }
    return multiply
}

print(maxPairwise([1,2,5,7,21,12,40,50,20]))

/*:
 ### Быстрый алгоритм
 - **Сложность** - O(n)
 */

func maxPairwiseFast(_ array: [Int]) -> Int {
    var maxInd1 = 0
    var maxInd2 = 0
    
    for i in 1..<array.count {
        if array[i] > array[maxInd1] {
            maxInd1 = i
        }
    }
    
    if maxInd1 == 0 {
        maxInd2 = 1
    }
    
    for i in 1..<array.count {
        if i != maxInd1 && array[i] > array[maxInd2] {
            maxInd2 = i
        }
    }
    
    return array[maxInd1] * array[maxInd2]
}
print(maxPairwiseFast([100000, 90000]))
//:  [Вперед](@next)
