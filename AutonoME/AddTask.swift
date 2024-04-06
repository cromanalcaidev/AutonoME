//
//  AddTask.swift
//  AutonoME
//
//  Created by Carlos Román Alcaide on 6/4/24.
//

import SwiftUI

struct AddTask: View {
    @Environment(\.dismiss) var dismiss
    
    var toDoList: ToDoList
    
    @State private var name = ""
    @State private var project = ""
    @State private var date = Date.now
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Task", text: $name)
                
                TextField("Project", text: $project)
                
                DatePicker("Deadline", selection: $date, in: date...)
                
            }
            .toolbar {
                Button("Add task") {
                    let task = ToDoItem(name: name, project: project, date: date)
                    toDoList.allToDos.append(task)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddTask(toDoList: ToDoList())
}
