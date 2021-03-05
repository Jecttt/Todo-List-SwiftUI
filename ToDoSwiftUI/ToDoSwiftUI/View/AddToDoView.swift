//
//  AddToDoView.swift
//  ToDoSwiftUI
//
//  Created by Macbook on 15/02/21.
//
//NSManagedObject = dia dapat mengikat object model kita ke bagian antar muka / interface / UI
//ManagedObjectContext = menyimpan konteks objek yang terkelola



import SwiftUI

struct AddToDoView: View {
    
    //PROPERTI//
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode // Untuk menutup lembar yang terbuka sekarang
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    
    @State private var showingError : Bool = false
    @State private var errorTitle: String = ""
    @State private var errorMassage: String = ""
    
    let priorities = ["High","Normal","Low"]
    //PROPERTI//
    
    var body: some View {
        NavigationView{
            VStack{
                VStack(alignment: .leading,spacing: 20){
                    TextField("Todo",text: $name)
                        .padding()
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(9)
                        .font(.system(size: 24,weight: .bold,design: .default))
                    Text("saya punya \(name)")
                    
                    // Mengapa memakai ( $ ) pada di property textfield ? . Karena bisa melakukan update secara dinamis
                    // Kalo tidak memakai ( $ ) tidak ada perubahan data
                    
                    Picker("Priority", selection: $priority){
                        ForEach(priorities, id: \.self){ // ( \.self ) id : 1,2,3 : Identifiable
                            
                            // Kegunaan Id : \.self adalah saat tidak tahu urutannya / Secara Random dan acak
                            
                            Text($0)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    Button(action: {
                        if self.name != ""{
                            let todo = Todo(context: self.managedObjectContext)
                            todo.name = self.name
                            todo.priority = self.priority
                            
                            do{
                                try self.managedObjectContext.save()
                                print("New todo : \(todo.name ?? ""), Priority :\(todo.priority ?? "")")
                            }catch{
                                print(error)
                            }
                        }else{
                            self.showingError = true
                            self.errorTitle = "Inpalid Name"
                            self.errorMassage = "Isi bagian yang kosong"
                            return
                        }
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        Text("Save")
                            .font(.system(size: 24,weight: .bold,design: .default))
                            .padding()
                            .frame(minWidth: 0,maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(9)
                            .foregroundColor(Color.white)
                    }
                }
                Spacer()
            }
            .navigationBarTitle("New Todo",displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }){
                                        Image(systemName: "mark")
                                    })
        }.alert(isPresented: $showingError){
            Alert(title: Text(errorTitle), message: Text(errorMassage), dismissButton: .default(Text("OK")))
        }
    }
}

struct AddToDoView_Previews: PreviewProvider {
    static var previews: some View {
        AddToDoView()
    }
}

// ( @State ) adlh penyedia data awal
//@State var name = "Joko"
//@State var name = "Rudi"

//TextField (nama: )
//Text (ini adalah kolom name)

//Text("nama")

//do = menampung yg benar
//catch = menampung yg salah

