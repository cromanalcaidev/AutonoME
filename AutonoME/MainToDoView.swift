//
//  MainToDoView.swift
//  AutonoME
//
//  Created by Carlos Román Alcaide on 13/4/24.
//

import SwiftUI

@Observable
class ToDoIst {
    var allToDoS = [TaskTemplate]()
}

struct MainToDoView: View {
    
    @State private var toDoIst = ToDoIst()
    
    @State private var completedTasks = [TaskTemplate]()
    
    @State private var seeSheet = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    List {
                        ForEach(0..<toDoIst.allToDoS.count, id: \.self) { toDo in
                            VStack {
                                HStack {
                                    Text("\(toDoIst.allToDoS[toDo].name)")
                                        .bold()
                                    Spacer()
                                    
                                    Button() {
                                        toDoIst.allToDoS.remove(at: toDo)
                                    } label: {
                                        Image(systemName: "circle.circle")
                                    }
                                    
                                }
                                
                                HStack {
                                    Text("\(toDoIst.allToDoS[toDo].project)")
                                    Spacer()
                                    Text("Priority: \(toDoIst.allToDoS[toDo].priority)")
                                    
                                }
                            }
                        }
                        .padding()
                        .listRowSeparator(.hidden)
                        .background(Color(.teal).opacity(0.7))
                    }
                    .navigationTitle("ToDo Title")
                    .toolbar {
                        Button("Add a task") {
                            seeSheet = true
                        }
                        .sheet(isPresented: $seeSheet) {
                            NewTask(toDoIst: toDoIst)
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color(.teal).opacity(0.7))
                    .listStyle(.plain)
                }
            }
        }
    }
}

#Preview {
    MainToDoView()
}
