//
//  Home.swift
//  afl4
//
//  Created by SIFT - Telkom DBT Air 6 on 29/05/22.
//

import SwiftUI
import RealmSwift

struct Home: View {
    //Sorting by date
    @ObservedResults(TaskItem.self, sortDescriptor: SortDescriptor.init(keyPath: "taskDate", ascending: false)) var tasksFetched
    
    
    @State var lastAddedTaskID: String = ""
    var body: some View {
        
        NavigationView{
            
            ZStack{
                
                if tasksFetched.isEmpty{
                    
                    Text("Add some new Tasks!")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                else{
                    List{
                        
                        ForEach(tasksFetched){task in
                            TaskRow(task: task)
                            //MARK: delete data
                                .swipeActions(edge: .trailing, allowsFullSwipe: true)
                                    {
                                    
                                    Button(role: .destructive){
                                        $tasksFetched.remove(task)
                                    }label: {
                                        Image(systemName: "trash")
                                    }
                                }
                        }
                    }
                    .listStyle(.insetGrouped)
                    .animation(.easeInOut, value: tasksFetched)
                }
            }
            .navigationTitle("Todo List")
            .toolbar {
                
                Button {
                    // MARK: Adding Tasks
                    let task = TaskItem()
                    lastAddedTaskID = task.id.stringValue
                    $tasksFetched.append(task)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct TaskRow: View{
    @ObservedRealmObject var task: TaskItem
    var body: some View{
        
        HStack(spacing: 15){
            
            //mark: task status indicator menu
            Menu {
                // mark:update data
                Button("Missed"){
                    $task.taskStatus.wrappedValue = .missed
                }
                Button("Completed"){
                    $task.taskStatus.wrappedValue = .completed
                }
            } label: {
                
                Circle()
                    .stroke(.gray)
                    .frame(width: 15, height: 15)
                    .overlay(
                    
                        Circle()
                            .fill(task.taskStatus == .missed ? .red :
                                    (task.taskStatus == .pending ? .yellow : .green))
                    )
            }
            
            VStack(alignment: .leading, spacing: 12) {
                
                //mark: Task Title
                TextField("Type to input data", text: $task.taskTitle)
                
                //mark task date
                if task.taskTitle != ""{
                    Picker(selection: .constant("")){
                        
                        DatePicker(selection: $task.taskDate, displayedComponents: .date) {
                            
                            
                        }
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                        .navigationTitle("Task Date")
                        
                    }label: {
                        
                        HStack{
                            Image(systemName: "calendar")
                            
                            Text(task.taskDate.formatted(date: .abbreviated, time: .omitted))
                        }
                    }
                }
            }
        }
    }
}
