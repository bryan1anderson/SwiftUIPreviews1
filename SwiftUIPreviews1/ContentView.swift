//
//  ContentView.swift
//  SwiftUIPreviews1
//
//  Created by Bryan Anderson on 1/29/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            GenericModelView(person: TestPerson(id: UUID(), firstName: "Bryan", lastName: "Anderson"))
                .tabItem {
                    Text("Generic")
                }
            
            ViewThatUsesTemplate(model: CoreDataModel(profileImage: UIImage(named: "profileimage"), firstName: "Bryan", lastName: "Anderson"))
                .tabItem {
                    Text("Template")
                }


            
            ViewBuilderView(photosView: {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(uiColor: .systemFill))
                    .frame(height: 140)
            }, tagsView: {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(uiColor: .systemFill))
                    .frame(width: 80, height: 80)

            }, peopleView: {
                Circle()
                    .fill(Color(uiColor: .systemFill))
                    .frame(width: 80)
            }, doneAction: {
                //called when it runs
            })
                .tabItem {
                    Text("ViewBuilder")
                }
            

        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
