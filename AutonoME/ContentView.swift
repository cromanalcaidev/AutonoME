//
//  ContentView.swift
//  AutonoME
//
//  Created by Carlos Román Alcaide on 6/4/24.
//

import SwiftUI

struct ToDoItem: Identifiable {
    let id = UUID()
    let name: String
    let project: String
    let date: Date
}

@Observable
class ToDoList {
    var allToDos = [ToDoItem]()
}

struct ContentView: View {
    @State private var toDoList = ToDoList()
    
    @State private var showSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDoList.allToDos) { toDo in
                    HStack {
                        VStack {
                            Text(toDo.name)
                            Text(toDo.project)
                        }
                        
                        Spacer()
                        
                        VStack {
                            Text("Due by")
                            Text(toDo.date, format: .dateTime.hour().minute())
                        }
                    }
                }
            }
            .navigationTitle("todo ist")
            .toolbar {
                Button("Add a task", systemImage: "plus.circle.fill") {
                    showSheet = true
                }
                .sheet(isPresented: $showSheet) {
                    AddTask(toDoList: toDoList)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
