// Playground - noun: a place where people can play

import Foundation

class LinkedList {
    
    var head: Node?
    
    func add(content: String){
        
        if self.head{
            
            self.head!.add(content)
        } else {
            
            self.head = Node(content)
        }
    }
    
    func cons(content: String){
        
        if self.head{
            
            self.head!.cons(content)
        } else {
            
            self.head = Node(content)
        }
    }
    
    func search(content: String) -> Node?{
        
        if self.head{
            
            return self.head!.search(content)
        } else {
            
           return nil
        }
    }
    
    func delete(content: String) -> Bool {
        
        return false
    }
    
    func size() -> Int {
        
        if self.head {
            
            return self.head!.size()
        }
        return 0
    }
    func print() {
    
        if self.head {
            
            println(self.head!.print())
        }
        else {
            
            println("Empty list")
        }
    }
}

class Node {
    
    var item: String
    var next: Node?
    
    init(_ content: String) {
        
        self.item = content
    }
    
    func add(content: String) {
        
        if let n = self.next {
            
            n.add(content)
            
        } else {
            
            self.next = Node(content)
        }
    }
    
    func cons(content: String){
        
        var oldNode = Node(self.item)
        oldNode.next = self.next
        
        self.item = content
        self.next = oldNode
    }
    
    func search(content: String) -> Node? {
        
        if self.item == content{
            
            return self
            
        } else if let n = self.next {
            
            return n.search(content)
        }
        
        return nil
    }
    
    func size() -> Int {
        
        if let n = self.next {
            return n.size()+1
        } else {
            return 1
        }
    }
    
    //TODO FIX THIS
    func print(str: String = "") -> String {
        
        var s = "\(str)->\(self.item)"
        
        if let n = self.next {
            return n.print(str: s)
        }
        
        return s
    }
}

var ll = LinkedList()
ll.add("adios")
ll.cons("hey")
ll.cons("whatever")
ll.cons("Hola")

ll.size()


println(ll.print())
