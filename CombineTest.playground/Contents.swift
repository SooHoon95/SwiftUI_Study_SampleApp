import UIKit
import Combine
//
//let justPublisher = Just([1,2,3,4,5])
//let intArr = [1,2,3,4,5]
//let publisher = intArr.publisher
////var cancellable = Set<AnyCancellable>()
//justPublisher
//    .sink { value in
//        print(value)
//    }
//
//intArr.publisher
//    .sink { value in
//        print(value)
//    }
//

let alphabetDictionary: [String: String] = ["a":"A", "b":"B"]
 
var keys: [String] = alphabetDictionary.map { (tuple: (String, String)) -> String in
    print(tuple)
    return tuple.0
}

print(keys) //["b", "a"]
