//
//  main.swift
//  DFS
//
//  Created by 김병엽 on 2022/01/20.
//  참고: 개발자 소들이 블로그

import Foundation

let graph: [String: [String]] = [
    "A" : ["B", "C"],
    "B" : ["A", "D", "E"],
    "C" : ["A", "F"],
    "D" : ["B"],
    "E" : ["B"],
    "F" : ["C"],
]

func DFS(graph: [String : [String]], start: String) -> [String] {
    // 방문했던 노드 배열
    var visitedQueue: [String] = []
    // 방문할 노드 Stack
    var needVisitStack: [String] = [start]
    
    while !(needVisitStack.isEmpty) {
        // 다음 방문할 노드를 needVisitStack에서 꺼냄
        let node: String = needVisitStack.removeLast()
        // 다음 방문할 노드가 visitedQueue에 있는지 확인, 있으면 continue
        if visitedQueue.contains(node) { continue }
        
        // 방문했던 노드를 visitedQueue에 추가
        visitedQueue.append(node)
        // 방문할 노드 Stack에 이후 방문할 노드를 추가, 없으면 빈 배열
        needVisitStack += graph[node] ?? []
    }
    return visitedQueue
}

print(DFS(graph: graph, start: "A"))

