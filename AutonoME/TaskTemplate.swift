//
//  TaskTemplate.swift
//  AutonoME
//
//  Created by Carlos Román Alcaide on 13/4/24.
//

import Foundation

struct TaskTemplate: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let project: String
    let dueDate: Date
    let priority: String
}


