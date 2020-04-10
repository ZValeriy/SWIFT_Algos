//: [Previous](@previous)    
//: [Главная](OverView)
/*:
## Задача с LeetCode. Given two strings S and T, return if they are equal when both are typed into empty text editors. # means a backspace character.


### Решение.
Решить с помощью стека, вынимая верхний, если #.
 Это решение не самое эффективное, так как занимает дополнительное место. И сложность O(N+M)
*/

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

backspaceCompare("ab#c", "ad#c")
backspaceCompare("ab##", "a#d#")
backspaceCompare("a##c", "#a#c")
backspaceCompare("a#c", "b")

/*:
 ### Эффективное Решение.
 С 2 указателями. Сложность остается такой же, но не нужно доп места. Но реализация более запутанная
 */

extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}

func backspaceCompareEffective(_ S: String, _ T: String) -> Bool {
    var i = S.count - 1, j = T.count - 1
    var skipS = 0, skipT = 0
    
    while i >= 0 || j >= 0 {
        while i>=0 {
            if S[i] == "#" {
                skipS += 1
                i -= 1
            } else if skipS > 0 {
                skipS -= 1
                i -= 1
            } else {
                break
            }
        }
        
        while j>=0 {
            if T[j] == "#" {
                skipT += 1
                j -= 1
            } else if skipT > 0 {
                skipT -= 1
                j -= 1
            } else {
                break
            }
        }
        
        if i >= 0 && j >= 0 && S[i] != T[j] {
            return false
        }
        
        if (i >= 0) != (j >= 0) {
            return false
        }
        
        i -= 1
        j -= 1
    }
    return true
}


backspaceCompareEffective("ab#c", "ad#c")
backspaceCompareEffective("ab##", "a#d#")
backspaceCompareEffective("a##c", "#a#c")
backspaceCompareEffective("a#c", "b")



//: [Next](@next)
