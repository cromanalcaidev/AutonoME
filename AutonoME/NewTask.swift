//
//  NewTask.swift
//  AutonoME
//
//  Created by Carlos Román Alcaide on 13/4/24.
//

import SwiftUI

struct NewTask: View {
    @Environment(\.dismiss) var dismiss
    
    var toDoIst: ToDoIst
    
    var priorityList = ["🆘", "⚠️", "🔜", "💆‍♀️"]
    var projectList = [String]()
    
    @State private var name = ""
    @State private var project = ""
    @State private var dueDate = Date.now
    @State private var priority = "💆‍♀️"
    
    var body: some View {
        
//        ZStack {
//            LinearGradient(colors: [.indigo, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
//                .ignoresSafeArea()
//            
//            RoundedRectangle(cornerRadius: 35)
//                .foregroundColor(Color.white.opacity(0.2))
//                .frame(width: 350, height: 230)
//                .shadow(radius: 15)
//            
//            RoundedRectangle(cornerRadius: 35)
//                .foregroundColor(Color.white.opacity(0.9))
//                .frame(width: 350, height: 230)
//                .mask {
//                    Form {
//                        
//                    }
//                    .background(Color.red)
//                    Text("YOLO")
//                        .foregroundStyle(.red)
//                    
//                    TextField("Hello", text: $name)
//                        .padding()
//                }
//            
//            
            
            NavigationStack {
                Form {
                    HStack {
                        TextField("New task", text: $name)
                        Picker("Priority", selection: $priority) {
                            ForEach(priorityList, id:\.self) {
                                Text("\($0)")
                            }
                        }
                    }
                    
                    HStack {
                        TextField("Add a project", text: $project)
                        Button("Create project") {
                            
                        }
                    }
                    
                    DatePicker("Due by", selection: $dueDate, in: dueDate...)
                    
                }
                .toolbar() {
                    Button("add task") {
                        let newToDo = TaskTemplate(name: name, project: project, dueDate: dueDate, priority: priority)
                        toDoIst.allToDoS.append(newToDo)
                        dismiss()
                    }
                }
            }
        
//        }
    }
}

#Preview {
    NewTask(toDoIst: ToDoIst())
}
