import SwiftUI
// View for displaying a single profile
struct UserProfileCardView: View {
    var profile: ProfileView
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(profile.image)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .padding(.bottom)
            
            Text(profile.name)
                .font(.title)
                .fontWeight(.bold)
            
            Text(profile.bio)
                .font(.body)
                .foregroundColor(.secondary)
            
            Spacer()
        }
        .padding()
        .navigationTitle("My Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Main view for the profile screen
struct ProfilesView: View {
    @State private var currentUserProfile = ProfileView(name: "Alex", bio: "Loves music and hiking", image: "profile1")

    var body: some View {
        NavigationView {
            ScrollView {
                UserProfileCardView(profile: currentUserProfile)
                    
                    .padding(.top, 8)
            }
            .background(Color(.systemGroupedBackground))
            .edgesIgnoringSafeArea(.all) // Ignore safe area to extend the background to the edges
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Use stack navigation view style if necessary
    }
}


struct ProfilesView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilesView()
    }
}
