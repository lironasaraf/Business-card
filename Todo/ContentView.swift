//
//  ContentView.swift
//  Quick Note
//
//

import SwiftUI
struct ContentView: View {
    
    @StateObject var noteslist: NotesList = NotesList()
    
    var body: some View {
        ZStack{
            Color(red: 10/100, green: 10/100, blue: 10/100)
            
            NavigationView {
                VStack {
                    List {
                        ForEach(noteslist.notes) { note in HStack {
                            Text(note.task)
                            Spacer()
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                                .onTapGesture {
                                    noteslist.deleteNote(note: note)
                                }
                        }
                        }
                    }
                    .navigationTitle("Todo List")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                noteslist.showAddNoteview.toggle()
                            } label: {
                                Image(systemName: "square.and.pencil" )
                            }
                        }
                    }
                    .sheet(isPresented: $noteslist.showAddNoteview) {
                        AddNoteView(noteslist: noteslist)
                    }
                }
            }
        }
    }
    
    struct Note: Identifiable, Equatable {
        var id = UUID()
        var task: String
    }


    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
