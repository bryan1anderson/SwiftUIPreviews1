//
//  GenericModelView.swift
//  SwiftUIPreviews1
//
//  Created by Bryan Anderson on 1/29/23.
//

import SwiftUI

protocol PersonDisplayable: Identifiable {
    var id: UUID { get }
    var firstName: String { get }
    var lastName: String { get }
    var profileImage: UIImage? { get async }
}

struct GenericModelView<T: PersonDisplayable>: View {
    
    let person: T
    
    @State private var profileImage: UIImage?
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
                Text(person.firstName)
                Text(person.lastName)
            }
            .font(.headline)
        }
        .padding()
        .background(Color(uiColor: .secondarySystemBackground))
        .cornerRadius(10)
        .task {
            profileImage = await person.profileImage
        }
    }
}

struct TestPerson: PersonDisplayable {
    let id: UUID
    let firstName: String
    let lastName: String
    var profileImage: UIImage?
}

struct GenericModelView_Previews: PreviewProvider {
    static var previews: some View {
        GenericModelView(person: TestPerson(id: UUID(), firstName: "Bryan", lastName: "Anderson", profileImage: UIImage(named: "profileimage")))
    }
}
