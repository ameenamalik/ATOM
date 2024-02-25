import SwiftUI
import Firebase

@main
struct ATOMApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    @StateObject var session = SessionStore()
    @State private var hasCompletedOnboarding = false

    var body: some Scene {
        WindowGroup {
            if session.isUserAuthenticated {
                HomeView()
            } else {
                if hasCompletedOnboarding {
                    LoginView(isUserLoggedIn: $session.isUserAuthenticated)
                } else {
                    OnboardingView(hasCompletedOnboarding: $hasCompletedOnboarding)
                }
            }
        }
    }
}

class SessionStore: ObservableObject {
    @Published var isUserAuthenticated: Bool = false
    
    init() {
        self.isUserAuthenticated = Auth.auth().currentUser != nil
        // Add listener if needed to manage the session state
    }
    
    // Include functions to handle user authentication state changes
    // For example, signIn, signOut, etc.
}

// ... rest of your views ...
