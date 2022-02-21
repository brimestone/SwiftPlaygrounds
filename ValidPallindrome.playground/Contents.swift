import UIKit


class Solution {
    func isSanitizePalindrome(_ s: String) -> Bool {
        let allowed = Array("abcdefghijklmnopqrstuvwxyz1234567890")
        var clean:[Character] = [Character]()
        
        for n in Array(s.lowercased()){
            if (allowed.firstIndex(of: n) != nil){
                clean.append(n)
            }
        }
        return (clean == Array(clean.reversed())) ? true : false
    }
    func isPalindrome(_ s: String) -> Bool {
        return (s == String(s.reversed())) ? true : false
    }
    
    
    func validPalindrome(_ s: String) -> Bool {
        let sArray = Array(s)
        var min = 0
        var max = sArray.count-1
        var diff = 0
        
        for _ in stride(from: 0, through: max, by: 1){
            
            if sArray[min] != sArray[max] {
                diff+=1
            }
            print(min, sArray[min], max, sArray[max])
            min+=1
            max-=1
        }
        return (diff>1) ? false : true
    }
    func validPalindromeWithOneDelete(_ s: String) -> Bool {
        
        
        
        return false
    }
    
}


let solution = Solution()
//solution.isSanitizePalindrome("A man, a plan, a canal: Panama") // true
//solution.isPalindrome("race a car") // false
//solution.isPalindrome(" ") // true
//
//solution.validPalindromeWithOneDelete("aba") //Input: s = "aba" Output: true
solution.validPalindromeWithOneDelete("abc") //Input: s = "aba" Output: false
//solution.validPalindromeWithOneDelete("abca") //Input: s = "abca" Output: true vffcnqxjjxqncffvmhvgsymdjgpfdhooxfuupuculmgmqfvnbgtapekouga") // true
//

//lcupuuf fuupucul

//solution.validPalindromeWithOneDelete("gveilrcbbktuhbtjdkwbgkwrxoltirxtbyfhsbmuoxixvnoidnxdfjunlwqnxdcialvuzbxlxgckmtoxdnfuygsuomtlkmqyrysxlvfdenmliwqmtjgcdxwmybfbssztnwkyyjqryscnvanqhcjnmpecuwapxivgacpdkiqucycvlrhwcvyyxrhjrqnhdxmldxwafigkijptrornrwtkpbssmwmittinzpetkfszeycftqoshxxhddazdapzjycvjjqlybhfcqiizsceqkycspkefdmhgtkdjzrypxdekirmggjgxkwkktmdncpqflactlrlnjrdwtnhojvmzqpljawdhbihbedvubmunidlwbjfogacropoueyjxunndejeprbyobuwomrqeycgqnlzqgilvrroibhigdrzliglblbdchzyetcpvyibvzfeacnbkiiwvnmgsgdpsewwfdjkcbaelvhcerimtqrecmiozptxngkjnzwgnhrkuiobdbvrknuvzyfgwwiskxapzvyjvyeohkfgujndhhfkrfpbbftshwvhilgvcfsrxuakrytfmrwshvsqzenkydebrfwoycnvmmxsdhkebyapgthudqjvnwpwwfbzsqqnkzuisndetqytjajwxjxkrwrxkdwqharaikyksxbfjaofmhsmjttocsnzgqadpqoifhlxyxevrgkpkjqiboktafkrdefrthdmruvwjgeqdauzbpymcuzftofolqestobheaahsokvxyzbztavndtgpvmmhhwcpvdknvbvvqjrqpvafxicpnxjqpnafmhrxalfmyimqpvqodxrytvxfqucsinfdgzbpbpohjxoakjjgafwmhutrxyivrxvvfpjczlwodelknbxgoavptkmvofuldokpoboznmljlhmsmaarotjzsivbirrfptkdimpbenmsdeobpdlebjpduymsamwxrdpotvvchojkcceoogmeyzajysffsyjazyemgooecckjohcvvtopdrxwmasmyudpjbeldpboedsmnebpmidktpfrribviszjtoraamsmhljlmnzobopkodlufovmktpvaogxbnkledowlzcjpfvvxrviyxrtuhmwfagjjkaoxjhopbpbzgdfniscuqfxvtyrxdoqvpqmiymflaxrhmfanpqjxnpcixfavpqrjqvvbvnkdvpcwhhmmvpgtdnvatzbzyxvkoshaaehbotseqlofotfzucmypbzuadqegjwvurmdhtrfedrkfatkobiqjkpkgrvexyxlhfioqpdaqgznscottjmshmfoajfbxskykiarahqwdkxrwrkxjxwjajtyqtednsiuzknqqszbfwwpwnvjqduhtgpaybekhdsxmmvncyowfrbedyknezqsvhswrmftyrkauxrsfcvglihvwhstfbbpfrkfhhdnjugfkhoeyvjyvzpaxksiwwgfyzvunkrvbdboiukrhngwznjkgnxtpzoimcerqtmirechvleabckjdfwwespdgsgmnvwiikbncaefzvbiyvpcteyzhcdblblgilzrdgihbiorrvligqzlnqgcyeqrmowuboybrpejednnuxjyeuoporcagofjbwldinumbuvdebhibhdwajlpqzmvjohntwdrjnlrltcalfqpcndmtkkwkxgjggmrikedxpyrzjdktghmdfekpscykqecsziiqcfhbylqjjvcyjzpadzaddhxxhsoqtfcyezsfktepznittimwmssbpktwrnrortpjikgifawxdlmxdhnqrjhrxyyvcwhrlvcycuqikdpcagvixpawucepmnjchqnavncsyrqjyykwntzssbfbymwxdcgjtmqwilmnedfvlxsyryqmkltmousgyufndxotmkcgxlxbzuvlaicdxnqwlnujfdxndionvxixoumbshfybtxritloxrwkgbwkdjtbhutkbbcrlievgu")
