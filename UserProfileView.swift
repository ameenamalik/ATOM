import SwiftUI

struct UserProfileView: View {
    @State private var username = "SwiftCoder"
    @State private var bio = "Lover of Swift and coffee."
    // Assume there are more editable fields as needed.
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")) {
                    HStack {
                        Text("Name")
                        Spacer()
                        Text("Jane Appleseed") // Static name
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("Age")
                        Spacer()
                        Text("28") // Static age
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("Location")
                        Spacer()
                        Text("Cupertino, CA") // Static location
                            .foregroundColor(.gray)
                    }
                }
                
                Section(header: Text("About")) {
                    TextField("Username", text: $username)
                    TextField("Bio", text: $bio)
                    // More editable fields here
                }
                
                Section {
                    Button(action: {
                        // Action for saving changes
                        saveProfile()
                    }) {
                        Text("Save Changes")
                    }
                }
                
                Section {
                    Button(role: .destructive, action: {
                        // Action for deleting the profile
                        deleteProfile()
                    }) {
                        HStack {
                            Image(systemName: "trash")
                            Text("Delete Profile")
                        }
                    }
                }
            }
            .navigationTitle("User Profile")
        }
    }
    
    func saveProfile() {
        // Implement the save functionality
        print("Profile saved")
    }
    
    func deleteProfile() {
        // Implement the delete functionality
        print("Profile deleted")
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}

