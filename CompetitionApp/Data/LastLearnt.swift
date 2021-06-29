//
//  LastLearnt.swift
//  CompetitionApp
//
//  Created by Rahala, Jasamrit (Coll) on 28/06/2021.
//

import Foundation

class LastLearnt: ObservableObject{
    
    /* GENERIC STACK based data structure to retrieve the most recent words learnt by the user */
    
    // constructor method
    @Published var root: Node?
    init(){
        self.root = nil
    }
    
    // check if stack is empty
    func isEmpty() -> Bool{
        return self.root == nil
    }
    
    // return latest value added to stack
    func pop() -> Any{
        let value = self.root!.value
        self.root = self.root!.next
        return value
    }
    
    // add some value (as a node) to the stack
    func push<T>(value: T){
        let newValue = Node(value: value)
        newValue.next = self.root
        self.root = newValue
    }

}

class Node{
    
    /* GENERIC NODE class, with next node pointer */
    
    // constructor method
    var value: Any
    var next: Node?
    init<T>(value: T){
        self.value = value
        self.next = nil
    }
}

// merge sort the array out of place
func mergeSort(array: [WordResponse]) -> [WordResponse]{
    
    if array.count == 1{ return array }
    let left = mergeSort(array: Array(array[0..<array.count / 2]))
    let right = mergeSort(array: Array(array[array.count / 2 ..< array.count]))
    
    var i = 0
    var j = 0
    
    var newArray = [WordResponse]()
    
    while i < left.count && j < right.count{
        if left[i].word! < right[j].word!{
            newArray.append(left[i])
            i += 1
        }
        else{
            newArray.append(right[j])
            j += 1
        }
    }
    
    while i < left.count{
        newArray.append(left[i])
        i += 1
    }
    
    while j < right.count{
        newArray.append(right[j])
        j += 1
    }
    
    return newArray
}

