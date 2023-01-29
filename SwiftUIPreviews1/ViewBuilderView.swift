//
//  ViewBuilderView.swift
//  SwiftUIPreviews1
//
//  Created by Bryan Anderson on 1/29/23.
//

import SwiftUI

struct ViewBuilderView<PhotosView: View, TagsView: View, PeopleView: View>: View {
    
    @ViewBuilder let photosView: PhotosView
    @ViewBuilder let tagsView: TagsView
    @ViewBuilder let peopleView: PeopleView
    let doneAction: () -> ()
    var body: some View {
        NavigationStack {
            List {
                Section("Photos") {
                    photosView
                }
                
                Section("Tags") {
                    tagsView
                }
                
                Section("People") {
                    peopleView
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Done", action: doneAction)
                }
            }
        }
    }
}

struct ViewBuilderView_Previews: PreviewProvider {
    static var previews: some View {
        ViewBuilderView {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(1...4, id: \.self) { item in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(uiColor: .systemFill))
                            .frame(width: 140, height: 140)
                    }
                }
            }
        } tagsView: {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(1...4, id: \.self) { item in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(uiColor: .systemFill))
                            .frame(width: 80, height: 60)
                    }
                }
            }
        } peopleView: {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(1...4, id: \.self) { item in
                        Circle()
                            .fill(Color(uiColor: .systemFill))
                            .frame(width: 80)
                    }
                }
            }
        } doneAction: {
            //called when done is pressed
        }

    }
}
