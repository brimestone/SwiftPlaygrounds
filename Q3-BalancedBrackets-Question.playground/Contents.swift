import UIKit

/*
 Balanced brackets
 https://www.hackerrank.com/challenges/balanced-brackets/problem
 
 A bracket is considered to be any one of the following characters: (, ), {, }, [, or ].
 
 Two brackets are considered to be a matched pair if the an opening bracket (i.e., (, [, or {) occurs to the left of a closing bracket (i.e., ), ], or }) of the exact same type. There are three types of matched pairs of brackets: [], {}, and ().
 
 A matching pair of brackets is not balanced if the set of brackets it encloses are not matched. For example, {[(])} is not balanced because the contents in between { and } are not balanced. The pair of square brackets encloses a single, unbalanced opening bracket, (, and the pair of parentheses encloses a single, unbalanced closing square bracket, ].
 
 By this logic, we say a sequence of brackets is balanced if the following conditions are met:
 
 It contains no unmatched brackets.
 The subset of brackets enclosed within the confines of a matched pair of brackets is also a matched pair of brackets.
 Given  strings of brackets, determine whether each sequence of brackets is balanced. If a string is balanced, return YES. Otherwise, return NO.
 
 */

func isBalanced(s: String) -> String { // "{[()]}"
    // O(n)
    let inputArr = Array(s)
    var map:[String:Int] = ["(":0, "[":0, "{":0]
    
    for value in inputArr{
        if value == "(" || value == ")"{
            map["("]! += 1
        }else if value == "[" || value == "]"{
            map["["]! += 1
        }else if value == "{" || value == "}"{
            map["{"]! += 1
        }
    }
    for element in map.keys{
        if (map[element]! % 2) != 0{
            return "No"
        }
    }
    return "Yes"
}


func isValid(_ s: String) -> Bool {
    var stacks:[Character] = [Character]()
    for c in s{
        if c == "(" || c == "{" || c == "["{
            stacks.append(c)
        }else{
            if stacks.isEmpty{ return false }
            if c == ")"{
                if stacks.popLast()! != "(" { return false }
            }else if c == "}"{
                if stacks.isEmpty{ return false }
                let tmp = stacks.popLast()!
                if tmp != "{" { return false }
            }else if c == "]"{
                if stacks.isEmpty{ return false }
                let tmp = stacks.popLast()!
                if tmp != "[" { return false }
            }
        }
    }
    return stacks.isEmpty ? true : false
}
isValid("([{})]") // No!!
isValid("()") // true

//isBalanced(s: "{[()]}") // Yes
//isBalanced(s: "[()]}") // No
//isBalanced(s: "{}()(){}((){})({[[({({(){}{}}){}})]{({()}((())))}()]})(({}(()){[][]}){()}(({}{}))())()[](){{((){})}}()([[]])[][]()({}((([()]{})())[][[()]]())){{}}[]{()}()[][]{}([])[]{({})}{}{{}{[[]]}[]{}}{[()]}[]{(([{{[{[]}]}[{}]}]))}(){}{{}}[]((([])([{(){}[(()[]((()(){})({([]({{{[]{}}[({})()({}{([()])()()[]{}})][{[]}]{{}([]({{{(()(({}[[[{{}}]]{{[()]([[{{}([[]][([{{}}(([])[][({()}())()({}[])]{}[])]())[]]){}}[]]])([]({{[[][]{[]}[]]}}{}(){[]}))}()[]((){{}()[{[[()]]}()]}[()]{})}][]{}))())}(())}{{[]}{}}({[([{[{[[[]]]{()}[]}]{}}()((({{{{({{(){}}}[[()]()[]]())({{{[]}{{[[{{[{}]}}[][]]]([][](()(()[]){{}}))([])}}}}[{}{}])[(){{()()}{(())}()}]{(){{}[]{}[][{[]([[]()]{(){[{}[()]][{}{}]{(){}}}{[]}}{[]}[]){[]}[]}][((){}{}[[[[{{}()[([({{[[][{{()}(([[]][[[[[[[{}]][{}]]]()](())[()[][]({({[][][[]{}][]}{})}{({})([[][]({}{[]})])[([([])][[]{([])(({}))}](()[]){[[]]}({}))]}[])()]]]))([{}()()([([[{}][()]][])])][[[{}][][]({[]})][(({{()}}))]])}]]}})])]}]]]])]}}}}}})))])]})}))}}}))})))]}])))") // Yes
