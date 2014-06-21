function Node(data){

	this.data = data
	this.next = null
}

function LinkedList(){

	this.head = null
	this.temp = null
	this.count = 0
}

LinkedList.prototype.get = function (i){

	var item = this.head

	if (i >= this.count || i < 0) throw new Error("Index out of bounds")

	while (i > 0){

		item = item.next
		i--
	}

	return item
}

LinkedList.prototype.add = function (data, i){

	i = i || this.count

	if (i < 0 || i > this.count){
		throw Error("Out of bounds")
	}

	var node = new Node(data)
	var last = this.head

	if (!last) this.head = node
	else {

		for (var j = 0; j<this.count; j++){

			if (j == i-1 || (i == 0 && j == 0)){

				if (last) {

					//Create a new node for the last node so it doesn't create an infinite circle
					var nextNode = new Node()
					nextNode.data = last.data
					if ('next' in nextNode) nextNode.next = last.next

					last.next = node
					node.next = nextNode
				}
				else {
					this.head = node
				}
			}

			last = last.next
		}
	}
	
	this.temp = last
	this.count++

}

LinkedList.prototype.print = function (){

	var print = ""
	var last = this.head

	for (var i = 0; i<this.count; i++){
		print += last.data + ((i+1 != this.count) ? " -> " : "")
		last = last.next
	}

	console.log(print)
}

var ll = new LinkedList()
ll.add(0)
ll.add(1)
ll.add(2)
ll.add(3)
ll.add(2, 3)
ll.print()

console.log(ll)
