//
//  ForumView.swift
//  ATOM
//
//  Created by Ameena Malik on 2024-02-20.
//

import Foundation
import SwiftUI

enum ForumType {
    case forum, friendForum
}


struct ForumView: View {
    @State private var selectedForum = ForumType.forum
    
    var body: some View {
        // Implement forum UI
        VStack {
                    Picker("Forums", selection: $selectedForum) {
                        Text("Forum").tag(ForumType.forum)
                        Text("Friend Forum").tag(ForumType.friendForum)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    switch selectedForum {
                    case .forum:
                        ForumsView() // Replace with your proper forum view
                    case .friendForum:
                        FriendForumView() // Replace with your friend forum view
                    }
                }
                .padding()
            }
        }

        // Example forum views (replace with your actual views)
        struct ForumsView: View {
            var body: some View {
                VStack {
                    Text("This is the proper forum view.")
                    // Add your forum content here
                }
                
            }
        }

        struct FriendForumView: View {
            var body: some View {
                Text("This is the friend forum view.")
                // Add your friend forum content here
            }
        }

        struct ForumView_Previews: PreviewProvider { // Updated preview name
            static var previews: some View {
                ForumView() // Updated to ForumView
            }
        }
