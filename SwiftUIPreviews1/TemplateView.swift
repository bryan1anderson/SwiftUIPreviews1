//
//  TemplateView.swift
//  SwiftUIPreviews1
//
//  Created by Bryan Anderson on 1/29/23.
//

import SwiftUI

struct CoreDataModel {
    let id = UUID()
    let profileImage: UIImage?
    let firstName: String
    let lastName: String
}
//We use this in our code, but no need to have a preview that runs it. After all, the preview is already running for TemplateView
struct ViewThatUsesTemplate: View {
    let model: CoreDataModel
    var body: some View {
        TemplateView(profileImage: model.profileImage, firstName: model.firstName, lastName: model.lastName)
    }
}

struct TemplateView: View {
    let profileImage: UIImage?
    let firstName: String
    let lastName: String
    
    var body: some View {
        VStack {
            if let profileImage {
                Color.clear
                    .frame(width: 150, height: 150)
                    .overlay {
                        Image(uiImage: profileImage)
                            .resizable()
                            .scaledToFill()
                    }
                    .clipShape(Circle())
            } else {
                Circle()
                    .fill(Color(uiColor: .systemFill))
                    .frame(width: 150)
            }
            
            VStack {
                Text(firstName)
                Text(lastName)
            }
            .font(.headline)
        }
        .padding()
        .background(Color(uiColor: .secondarySystemBackground))
        .cornerRadius(10)
    }
}

struct TemplateView_Previews: PreviewProvider {
    static var previews: some View {
        TemplateView(profileImage: nil, firstName: "Bryan", lastName: "Anderson")
    }
}
