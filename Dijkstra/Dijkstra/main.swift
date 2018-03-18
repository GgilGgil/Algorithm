//
//  main.swift
//  Dijkstra
//
//  Created by Park GilNam on 2018. 3. 16..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import Foundation

class Node {
    var visited = false //방문 유무
    var connections: [Connection] = [] //노드에 연결된 다른 노드정보
}

class Connection {
    public let to: Node
    public let weight: Int
    
    public init(to node: Node, weight: Int) {
        assert(weight >= 0, "weight has to be equal or greater than zero")
        self.to = node
        self.weight = weight
    }
}

class Path {
    public let cumulativeWeight: Int
    public let node: Node
    public let previousPath: Path?
    
    init(to node: Node, via connection: Connection? = nil, previousPath path: Path? = nil) {
        if
            let previousPath = path,
            let viaConnection = connection {
            self.cumulativeWeight = viaConnection.weight + previousPath.cumulativeWeight
        } else {
            self.cumulativeWeight = 0
        }
        
        self.node = node
        self.previousPath = path
    }
}

extension Path {
    var array: [Node] {
        var array: [Node] = [self.node]
        
        var iterativePath = self
        while let path = iterativePath.previousPath {
            array.append(path.node)
            
            iterativePath = path
        }
        
        return array
    }
}

func shortestPath(source: Node, destination: Node) -> Path? {
    var frontier: [Path] = [] {
        didSet { frontier.sort { return $0.cumulativeWeight < $1.cumulativeWeight } } //값이 입력되면 정렬을 수행
    }
    
    frontier.append(Path(to: source)) // the frontier is made by a path that starts nowhere and ends in the source
    
    while !frontier.isEmpty {
        let cheapestPathInFrontier = frontier.removeFirst() // getting the cheapest path available
        
        guard !cheapestPathInFrontier.node.visited else {
            continue
        } // making sure we haven't visited the node already
        
        if cheapestPathInFrontier.node === destination {
            return cheapestPathInFrontier // found the cheapest path 😎
        }
        
        cheapestPathInFrontier.node.visited = true
        
        for connection in cheapestPathInFrontier.node.connections where !connection.to.visited { // adding new paths to our frontier
            frontier.append(Path(to: connection.to, via: connection, previousPath: cheapestPathInFrontier))
        }
    } // end while
    return nil // we didn't find a path 😣
}

// **** EXAMPLE BELOW ****
class MyNode: Node {
    let name: String
    
    init(name: String) {
        self.name = name
        super.init()
    }
}

let nodeA = MyNode(name: "A")
let nodeB = MyNode(name: "B")
let nodeC = MyNode(name: "C")
let nodeD = MyNode(name: "D")
let nodeE = MyNode(name: "E")
let nodeF = MyNode(name: "F")

nodeA.connections.append(Connection(to: nodeB, weight: 3))
nodeA.connections.append(Connection(to: nodeC, weight: 2))
nodeA.connections.append(Connection(to: nodeD, weight: 4))

nodeB.connections.append(Connection(to: nodeA, weight: 3))
nodeB.connections.append(Connection(to: nodeD, weight: 2))
nodeB.connections.append(Connection(to: nodeF, weight: 5))

nodeC.connections.append(Connection(to: nodeA, weight: 2))
nodeC.connections.append(Connection(to: nodeE, weight: 1))

nodeD.connections.append(Connection(to: nodeA, weight: 4))
nodeD.connections.append(Connection(to: nodeB, weight: 2))
nodeD.connections.append(Connection(to: nodeE, weight: 1))
nodeD.connections.append(Connection(to: nodeF, weight: 3))

nodeE.connections.append(Connection(to: nodeC, weight: 1))
nodeE.connections.append(Connection(to: nodeD, weight: 1))
nodeE.connections.append(Connection(to: nodeF, weight: 2))

nodeF.connections.append(Connection(to: nodeB, weight: 5))
nodeF.connections.append(Connection(to: nodeD, weight: 3))
nodeF.connections.append(Connection(to: nodeE, weight: 2))

let sourceNode = nodeA
let destinationNode = nodeF

var path = shortestPath(source: sourceNode, destination: destinationNode)

if let succession: [String] = path?.array.reversed().flatMap({ $0 as? MyNode}).map({$0.name}) {
    print("🏁 Quickest path: \(succession)")
} else {
    print("💥 No path between \(sourceNode.name) & \(destinationNode.name)")
}
