class BinaryTree {
    
    var data: Int?
    
    var left: BinaryTree?
    var right: BinaryTree?
    
    init(_ d: Int?){
        
        if d {
            self.data = d
        }
    }
    
    func insert(d: Int) {
        
        if !self.data{
            
            self.data = d
            
        } else {
            
            if d < self.data {
                
                if let l = self.left {
                    
                    l.insert(d)
                    
                } else {
                    
                    var tree = BinaryTree(d)
                    self.left = tree
                }
                
            } else {
                
                if let r = self.right {
                    
                    r.insert(d)
                    
                } else {
                    
                    var tree = BinaryTree(d)
                    self.right = tree
                }
            }
        }
        
        //FANCY WAY THAT MAKES THE COMPILER CRY
       /* switch (self.data, self.left, self.right){
        case let (.None, _, _):
            self.data = d
        case let (da, .Some(l), _) where da < d:
            l.insert(d)
        case let (da, .None, _) where da < d:
            self.left = BinaryTree(d)
        case let (da, _, .Some(r)) where da >= d:
            r.insert(d)
        case let (da, _, .None) where da >= d:
            self.right = BinaryTree(d)
        case let (_, _, _):
            println("wtf")
            
        }*/
    }
}

var tree = BinaryTree(5)
tree.insert(2)
tree.insert(7)

println(tree.left!.data)
