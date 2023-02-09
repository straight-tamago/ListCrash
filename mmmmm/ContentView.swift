//
//  ContentView.swift
//  mmmmm
//
//  Created by mini on 2023/02/09.
//

import SwiftUI

struct MMM: Codable {
    var Name: String = ""
    var Child: [MMM] = [MMM]()
}

struct ContentView: View {
    @State var mmm = [MMM]()
    var body: some View {
        NavigationView {
            List_View(
                mmm: $mmm
            )
        }
    }
}

struct List_View: View {
    @Binding var mmm: [MMM]
    
    var body: some View {
        ZStack{
            List {
                Button("Create Folder"){
                    mmm.append(
                        MMM(Name: "Name")
                    )
                }
                ForEach(mmm.indices, id: \.self) { index in
                    NavigationLink(
                        destination: List_View(
                            mmm: $mmm[index].Child
                        ),
                        label: {
                            Text(mmm[index].Name)
                        }
                    )
                    .contextMenu {
                        Button {
                            mmm.remove(at: index)
                        }label: {
                            Text("Remove Item")
                        }
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
