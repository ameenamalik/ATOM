import SwiftUI

struct HomeView: View {
    // Example state properties
    @State private var selectedTab = 0
    // Sample Profile instance for demonstration
        private let sampleProfile = ProfileView(name: "Sample Name", bio: "Sample Bio", image: "sampleImage") // Ensure "sampleImage" exists in your assets

    
    var body: some View {
        NavigationView {
            VStack {
                greetingSection
                Divider()
                mainContent
                Spacer()
            }
            .navigationBarTitle("Welcome", displayMode: .inline)
            .navigationBarItems(trailing: logOutButton)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    // MARK: - Components
    
    private var greetingSection: some View {
        Text("Good Morning, User!")
            .font(.title)
            .padding()
    }
    
    private var mainContent: some View {
            NavigationLink(destination: UserProfileCardView(profile: sampleProfile)) { // Pass the sampleProfile instance here
                Text("Go to Profile Card")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }

    
    private var logOutButton: some View {
        Button(action: {
            // Handle log out action
        }) {
            Text("Log Out")
        }
    }
}

// MARK: - Preview

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
