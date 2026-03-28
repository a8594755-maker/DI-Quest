import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var email = ""
    @State private var password = ""
    @State private var isSignUp = false
    @State private var showResetPassword = false
    @State private var logoScale: CGFloat = 0.8
    @State private var logoOpacity: Double = 0
    @State private var contentOffset: CGFloat = 40
    @State private var contentOpacity: Double = 0
    @FocusState private var focusedField: Field?

    private enum Field { case email, password }

    var body: some View {
        ZStack {
            backgroundLayer

            ScrollView {
                VStack(spacing: 0) {
                    Spacer().frame(height: 80)

                    // Logo & Title
                    VStack(spacing: 20) {
                        ZStack {
                            Circle()
                                .fill(DIQuestTheme.accent.opacity(0.15))
                                .frame(width: 160, height: 160)
                                .blur(radius: 30)

                            RoundedRectangle(cornerRadius: 32)
                                .fill(DIQuestTheme.accentGradient)
                                .frame(width: 120, height: 120)
                                .shadow(color: DIQuestTheme.accent.opacity(0.5), radius: 24, y: 8)
                                .overlay(
                                    Image(systemName: "briefcase.fill")
                                        .font(.system(size: 52, weight: .medium))
                                        .foregroundStyle(.white)
                                )
                        }
                        .scaleEffect(logoScale)
                        .opacity(logoOpacity)

                        VStack(spacing: 8) {
                            Text("DI Quest")
                                .font(.system(size: 36, weight: .bold, design: .rounded))
                                .foregroundStyle(.white)

                            Text("Business Case Practice")
                                .font(.system(size: 16, weight: .medium, design: .rounded))
                                .foregroundStyle(DIQuestTheme.textTertiary)
                        }
                        .opacity(logoOpacity)
                    }

                    Spacer().frame(height: 40)

                    // Email/Password Form
                    VStack(spacing: 16) {
                        VStack(spacing: 12) {
                            // Email field
                            HStack(spacing: 12) {
                                Image(systemName: "envelope.fill")
                                    .font(.system(size: 16))
                                    .foregroundStyle(DIQuestTheme.textTertiary)
                                    .frame(width: 20)
                                TextField("Email", text: $email)
                                    .textContentType(.emailAddress)
                                    .keyboardType(.emailAddress)
                                    .autocorrectionDisabled()
                                    .textInputAutocapitalization(.never)
                                    .foregroundStyle(.white)
                                    .focused($focusedField, equals: .email)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 14)
                            .background(Color.white.opacity(0.08))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(focusedField == .email ? DIQuestTheme.accent.opacity(0.6) : Color.white.opacity(0.1), lineWidth: 1)
                            )

                            // Password field
                            HStack(spacing: 12) {
                                Image(systemName: "lock.fill")
                                    .font(.system(size: 16))
                                    .foregroundStyle(DIQuestTheme.textTertiary)
                                    .frame(width: 20)
                                SecureField(LanguageManager.shared.string("auth.password"), text: $password)
                                    .textContentType(isSignUp ? .newPassword : .password)
                                    .foregroundStyle(.white)
                                    .focused($focusedField, equals: .password)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 14)
                            .background(Color.white.opacity(0.08))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(focusedField == .password ? DIQuestTheme.accent.opacity(0.6) : Color.white.opacity(0.1), lineWidth: 1)
                            )
                        }

                        // Error message
                        if let error = authManager.errorMessage {
                            Text(error)
                                .font(.system(size: 13, weight: .medium))
                                .foregroundStyle(.red)
                                .multilineTextAlignment(.center)
                        }

                        // Submit button
                        Button {
                            focusedField = nil
                            if isSignUp {
                                authManager.signUpWithEmail(email: email, password: password)
                            } else {
                                authManager.signInWithEmail(email: email, password: password)
                            }
                        } label: {
                            Text(isSignUp ? LanguageManager.shared.string("auth.signUp") : LanguageManager.shared.string("auth.signIn"))
                                .font(.system(size: 17, weight: .bold))
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(DIQuestTheme.accentGradient)
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                        }
                        .disabled(authManager.isLoading)

                        // Toggle sign up / sign in
                        HStack {
                            Button {
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    isSignUp.toggle()
                                    authManager.errorMessage = nil
                                }
                            } label: {
                                HStack(spacing: 4) {
                                    Text(isSignUp ? LanguageManager.shared.string("auth.hasAccount") : LanguageManager.shared.string("auth.noAccount"))
                                        .foregroundStyle(DIQuestTheme.textTertiary)
                                    Text(isSignUp ? LanguageManager.shared.string("auth.signIn") : LanguageManager.shared.string("auth.signUp"))
                                        .foregroundStyle(DIQuestTheme.accent)
                                        .fontWeight(.semibold)
                                }
                                .font(.system(size: 14))
                            }

                            if !isSignUp {
                                Spacer()
                                Button {
                                    showResetPassword = true
                                } label: {
                                    Text(LanguageManager.shared.string("auth.forgotPassword"))
                                        .font(.system(size: 14))
                                        .foregroundStyle(DIQuestTheme.textTertiary)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 36)
                    .offset(y: contentOffset)
                    .opacity(contentOpacity)

                    // Divider
                    HStack {
                        Rectangle()
                            .fill(Color.white.opacity(0.15))
                            .frame(height: 1)
                        Text(LanguageManager.shared.string("auth.or"))
                            .font(.system(size: 13))
                            .foregroundStyle(DIQuestTheme.textTertiary)
                            .padding(.horizontal, 12)
                        Rectangle()
                            .fill(Color.white.opacity(0.15))
                            .frame(height: 1)
                    }
                    .padding(.horizontal, 36)
                    .padding(.vertical, 24)
                    .offset(y: contentOffset)
                    .opacity(contentOpacity)

                    // OAuth Buttons
                    VStack(spacing: 12) {
                        // Google Button
                        Button {
                            if let anchor = presentationAnchor {
                                authManager.signInWithGoogle(presentationAnchor: anchor)
                            }
                        } label: {
                            HStack(spacing: 12) {
                                Image(systemName: "g.circle.fill")
                                    .font(.system(size: 20))
                                Text(LanguageManager.shared.string("auth.signInWithGoogle"))
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                        }

                        // Apple Button
                        Button {
                            if let anchor = presentationAnchor {
                                authManager.signInWithApple(presentationAnchor: anchor)
                            }
                        } label: {
                            HStack(spacing: 12) {
                                Image(systemName: "apple.logo")
                                    .font(.system(size: 18))
                                Text(LanguageManager.shared.string("auth.signInWithApple"))
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(Color.white.opacity(0.1))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 14)
                                            .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                    )
                            )
                        }
                    }
                    .padding(.horizontal, 36)
                    .offset(y: contentOffset)
                    .opacity(contentOpacity)

                    if authManager.isLoading {
                        ProgressView()
                            .tint(.white)
                            .padding(.top, 20)
                    }

                    Spacer().frame(height: 40)
                }
            }
            .scrollDismissesKeyboard(.interactively)
        }
        .sheet(isPresented: $showResetPassword) {
            PasswordResetView()
                .environmentObject(authManager)
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.8)) {
                logoScale = 1.0
                logoOpacity = 1.0
            }
            withAnimation(.easeOut(duration: 0.7).delay(0.3)) {
                contentOffset = 0
                contentOpacity = 1.0
            }
        }
    }

    // MARK: - Background

    @ViewBuilder
    private var backgroundLayer: some View {
        ZStack {
            DIQuestTheme.backgroundGradient
                .ignoresSafeArea()

            Circle()
                .fill(DIQuestTheme.accent.opacity(0.08))
                .frame(width: 300, height: 300)
                .offset(x: -120, y: -280)
                .blur(radius: 60)

            Circle()
                .fill(DIQuestTheme.accentSecondary.opacity(0.06))
                .frame(width: 250, height: 250)
                .offset(x: 150, y: 300)
                .blur(radius: 50)
        }
    }

    private var presentationAnchor: ASPresentationAnchor? {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first?.windows.first
    }
}

// MARK: - Password Reset View

struct PasswordResetView: View {
    @EnvironmentObject var authManager: AuthManager
    @Environment(\.dismiss) private var dismiss
    @State private var email = ""
    @State private var sent = false

    var body: some View {
        NavigationStack {
            ZStack {
                DIQuestTheme.background.ignoresSafeArea()

                VStack(spacing: 24) {
                    Spacer()

                    Image(systemName: sent ? "envelope.badge.fill" : "lock.rotation")
                        .font(.system(size: 56))
                        .foregroundStyle(sent ? .green : DIQuestTheme.accent)

                    Text(sent ? LanguageManager.shared.string("auth.resetEmailSent") : LanguageManager.shared.string("auth.resetPassword"))
                        .font(.system(size: 22, weight: .bold))
                        .foregroundStyle(.white)

                    Text(sent ? LanguageManager.shared.string("auth.checkInbox") : LanguageManager.shared.string("auth.enterEmailForReset"))
                        .font(.system(size: 14))
                        .foregroundStyle(DIQuestTheme.textSecondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)

                    if !sent {
                        HStack(spacing: 12) {
                            Image(systemName: "envelope.fill")
                                .foregroundStyle(DIQuestTheme.textTertiary)
                                .frame(width: 20)
                            TextField("Email", text: $email)
                                .textContentType(.emailAddress)
                                .keyboardType(.emailAddress)
                                .autocorrectionDisabled()
                                .textInputAutocapitalization(.never)
                                .foregroundStyle(.white)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 14)
                        .background(Color.white.opacity(0.08))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(.horizontal, 36)

                        if let error = authManager.errorMessage {
                            Text(error)
                                .font(.system(size: 13))
                                .foregroundStyle(error.contains(LanguageManager.shared.string("auth.resetSent")) ? .green : .red)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }

                        Button {
                            authManager.resetPassword(email: email)
                            sent = true
                        } label: {
                            Text(LanguageManager.shared.string("auth.sendResetLink"))
                                .font(.system(size: 17, weight: .bold))
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(DIQuestTheme.accentGradient)
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                        }
                        .disabled(email.isEmpty || authManager.isLoading)
                        .padding(.horizontal, 36)
                    }

                    Spacer()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(LanguageManager.shared.string("auth.close")) { dismiss() }
                        .foregroundStyle(DIQuestTheme.accent)
                }
            }
        }
    }
}
