//
//  MessagesView.swift
//  ATOM
//
//  Created by Ameena Malik on 2024-02-20.
//

import Foundation
import SwiftUI


struct GroupChat: Identifiable {
    let id: UUID = UUID()
    let name: String
    let members: [ChatMember]
    let recentMessage: String
}

struct ChatMember: Identifiable {
    let id: UUID = UUID()
    let name: String
    let profilePictureURL: String // In a real app, this would be a URL
}

struct GroupChatView: View {
    let chat: GroupChat

    var body: some View {
        HStack {
            // Display the first three members' profile pictures
            ForEach(chat.members.prefix(3)) { member in
                // In a real app, you'd download the image from `member.profilePictureURL`
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            }
            VStack(alignment: .leading) {
                Text(chat.name)
                    .font(.headline)
                Text(chat.recentMessage)
                    .font(.subheadline)
                    .lineLimit(1)
            }
        }
    }
}


struct MessagesView: View {
    @State private var groupChats: [GroupChat] = [
        // Sample data
        GroupChat(name: "Family", members: [ChatMember(name: "Alice", profilePictureURL: ""), ChatMember(name: "Bob", profilePictureURL: "")], recentMessage: "How's everyone?"),
        GroupChat(name: "Friends", members: [ChatMember(name: "Charlie", profilePictureURL: ""), ChatMember(name: "Dave", profilePictureURL: "")], recentMessage: "Movie night?"),
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(groupChats) { chat in
                    GroupChatView(chat: chat)
                }
            }
            .navigationTitle("Group Chats")
            .toolbar {
                Button(action: {
                    // Action to create a new group
                }) {
                    Image(systemName: "plus.message")
                }
            }
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
