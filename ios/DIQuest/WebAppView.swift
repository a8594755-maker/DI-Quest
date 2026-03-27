import SwiftUI
import WebKit
import AuthenticationServices

// MARK: - Configuration

enum AppConfig {
    #if DEBUG
    static let baseURL = "http://localhost:5173/di-quest"
    // For real device testing, use your Mac's local IP:
    // static let baseURL = "http://192.168.1.100:5173/di-quest"
    #else
    static let baseURL = "https://di-quest.netlify.app/di-quest"
    #endif

    static let appUserAgent = "DIQuestApp/1.0 (iOS; native)"
    static let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"

    // OAuth: ASWebAuthenticationSession callback
    static let oauthCallbackScheme = "com.diquest.app"
    static let oauthCallbackURL = "com.diquest.app://auth-callback"
}

// MARK: - WebAppView

struct WebAppView: View {
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @StateObject private var viewModel = WebViewModel()
    @State private var showSplash = true
    @State private var showSettings = false

    var body: some View {
        ZStack {
            Color(red: 0.06, green: 0.09, blue: 0.16) // matches web bg-gray-900
                .ignoresSafeArea()

            if !networkMonitor.isConnected && viewModel.errorMessage != nil {
                offlineView
            } else if let error = viewModel.errorMessage {
                errorView(error)
            } else {
                webContent
            }

            if showSplash {
                splashScreen
            }
        }
        .sheet(isPresented: $showSettings) {
            SettingsView()
        }
        .onChange(of: viewModel.showSettings) { show in
            if show {
                showSettings = true
                viewModel.showSettings = false
            }
        }
        .onChange(of: networkMonitor.isConnected) { connected in
            if connected && viewModel.errorMessage != nil {
                viewModel.reload()
            }
        }
    }

    // MARK: - Web Content

    private var webContent: some View {
        ZStack {
            WebViewContainer(viewModel: viewModel)
                .ignoresSafeArea(.container, edges: .bottom)

            if viewModel.isLoading && viewModel.loadingProgress < 0.95 {
                loadingOverlay
            }
        }
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in } // absorb to prevent conflicts
        )
    }

    // MARK: - Splash Screen

    private var splashScreen: some View {
        ZStack {
            Color(red: 0.06, green: 0.09, blue: 0.16)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                // App icon placeholder
                ZStack {
                    RoundedRectangle(cornerRadius: 24)
                        .fill(
                            LinearGradient(
                                colors: [Color(hex: "6366f1"), Color(hex: "8b5cf6")],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 100, height: 100)
                        .shadow(color: Color(hex: "6366f1").opacity(0.4), radius: 20)

                    Image(systemName: "briefcase.fill")
                        .font(.system(size: 44))
                        .foregroundStyle(.white)
                }

                Text("DI Quest")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)

                Text("Business Case Practice")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.6))
            }
        }
        .transition(.opacity)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(.easeOut(duration: 0.4)) {
                    showSplash = false
                }
            }
        }
    }

    // MARK: - Loading Overlay

    private var loadingOverlay: some View {
        VStack(spacing: 12) {
            ProgressView()
                .scaleEffect(1.2)
                .tint(.white)

            Text("載入中...")
                .font(.subheadline)
                .foregroundStyle(.white)

            ProgressView(value: viewModel.loadingProgress)
                .progressViewStyle(.linear)
                .tint(Color(hex: "6366f1"))
                .frame(width: 120)
        }
        .padding(24)
        .background(.ultraThinMaterial.opacity(0.9))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 10)
    }

    // MARK: - Error View

    private func errorView(_ message: String) -> some View {
        VStack(spacing: 20) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 48))
                .foregroundStyle(.orange)

            Text("載入失敗")
                .font(.title2.bold())
                .foregroundStyle(.white)

            Text(message)
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.7))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)

            Button(action: { viewModel.reload() }) {
                Label("重試", systemImage: "arrow.clockwise")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 12)
                    .background(Color(hex: "6366f1"))
                    .clipShape(Capsule())
            }
        }
    }

    // MARK: - Offline View

    private var offlineView: some View {
        VStack(spacing: 20) {
            Image(systemName: "wifi.slash")
                .font(.system(size: 48))
                .foregroundStyle(.white.opacity(0.5))

            Text("沒有網路連線")
                .font(.title2.bold())
                .foregroundStyle(.white)

            Text("請檢查您的網路設定後再試一次")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.6))

            Button(action: { viewModel.reload() }) {
                Label("重試", systemImage: "arrow.clockwise")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 12)
                    .background(Color(hex: "6366f1"))
                    .clipShape(Capsule())
            }
        }
    }
}

// MARK: - WebView Container

struct WebViewContainer: UIViewRepresentable {
    @ObservedObject var viewModel: WebViewModel

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.websiteDataStore = .default()
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []

        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        config.defaultWebpagePreferences = prefs

        // Inject native app flag + bridge capabilities before page loads
        let bridgeScript = WKUserScript(
            source: """
            window.__DI_QUEST_NATIVE__ = true;
            window.__DI_QUEST_VERSION__ = '\(AppConfig.appVersion)';
            window.__DI_QUEST_BRIDGE__ = {
                haptics: true,
                share: true,
                biometrics: true,
                settings: true
            };
            """,
            injectionTime: .atDocumentStart,
            forMainFrameOnly: true
        )
        config.userContentController.addUserScript(bridgeScript)

        // Register native bridge message handlers
        let bridge = NativeBridge()
        bridge.register(on: config.userContentController)
        bridge.onOpenSettings = { [weak viewModel] in
            viewModel?.showSettings = true
        }

        let webView = WKWebView(frame: .zero, configuration: config)
        webView.navigationDelegate = context.coordinator
        webView.uiDelegate = context.coordinator
        webView.customUserAgent = AppConfig.appUserAgent
        webView.allowsBackForwardNavigationGestures = true
        webView.isOpaque = false
        webView.backgroundColor = .clear
        webView.scrollView.backgroundColor = .clear

        // Pull-to-refresh
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .white
        refreshControl.addTarget(
            context.coordinator,
            action: #selector(Coordinator.handleRefresh(_:)),
            for: .valueChanged
        )
        webView.scrollView.refreshControl = refreshControl
        webView.scrollView.bounces = true

        // Wire up bridge and view model
        bridge.webView = webView
        context.coordinator.bridge = bridge

        viewModel.webView = webView
        viewModel.setupProgressObserver()
        viewModel.loadURL()

        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(viewModel: viewModel)
    }

    // MARK: - Coordinator

    class Coordinator: NSObject, WKNavigationDelegate, WKUIDelegate, ASWebAuthenticationPresentationContextProviding {
        let viewModel: WebViewModel
        var bridge: NativeBridge?
        private var authSession: ASWebAuthenticationSession?

        init(viewModel: WebViewModel) {
            self.viewModel = viewModel
        }

        deinit {
            if let bridge, let controller = bridge.webView?.configuration.userContentController {
                bridge.unregister(from: controller)
            }
        }

        // MARK: ASWebAuthenticationPresentationContextProviding

        func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
            guard let scene = UIApplication.shared.connectedScenes
                .compactMap({ $0 as? UIWindowScene }).first,
                  let window = scene.windows.first else {
                return ASPresentationAnchor()
            }
            return window
        }

        @objc func handleRefresh(_ sender: UIRefreshControl) {
            viewModel.webView?.reload()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                sender.endRefreshing()
            }
        }

        // MARK: Navigation

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            viewModel.isLoading = true
            viewModel.errorMessage = nil
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            viewModel.isLoading = false
        }

        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            viewModel.isLoading = false
            handleError(error)
        }

        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
            viewModel.isLoading = false
            handleError(error)
        }

        func webView(_ webView: WKWebView,
                      decidePolicyFor navigationAction: WKNavigationAction,
                      decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            guard let url = navigationAction.request.url else {
                decisionHandler(.allow)
                return
            }

            let urlString = url.absoluteString

            // Intercept OAuth flows — Google blocks sign-in inside WKWebView
            if isOAuthURL(url) {
                decisionHandler(.cancel)
                handleOAuthInSystemBrowser(url: url)
                return
            }

            // Special protocols → system handler
            if urlString.hasPrefix("tel:") || urlString.hasPrefix("mailto:") || urlString.hasPrefix("sms:") {
                UIApplication.shared.open(url)
                decisionHandler(.cancel)
                return
            }

            // External links → open in Safari
            if navigationAction.navigationType == .linkActivated,
               let host = url.host,
               !isInternalHost(host) {
                UIApplication.shared.open(url)
                decisionHandler(.cancel)
                return
            }

            decisionHandler(.allow)
        }

        // MARK: UI Delegate

        func webView(_ webView: WKWebView,
                      runJavaScriptAlertPanelWithMessage message: String,
                      initiatedByFrame frame: WKFrameInfo,
                      completionHandler: @escaping () -> Void) {
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "確定", style: .default) { _ in completionHandler() })
            topViewController()?.present(alert, animated: true)
        }

        func webView(_ webView: WKWebView,
                      runJavaScriptConfirmPanelWithMessage message: String,
                      initiatedByFrame frame: WKFrameInfo,
                      completionHandler: @escaping (Bool) -> Void) {
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "取消", style: .cancel) { _ in completionHandler(false) })
            alert.addAction(UIAlertAction(title: "確定", style: .default) { _ in completionHandler(true) })
            topViewController()?.present(alert, animated: true)
        }

        func webView(_ webView: WKWebView,
                      createWebViewWith configuration: WKWebViewConfiguration,
                      for navigationAction: WKNavigationAction,
                      windowFeatures: WKWindowFeatures) -> WKWebView? {
            // target="_blank" → open in same webview (internal) or Safari (external)
            if let url = navigationAction.request.url {
                if let host = url.host, !isInternalHost(host) {
                    UIApplication.shared.open(url)
                } else {
                    webView.load(URLRequest(url: url))
                }
            }
            return nil
        }

        // MARK: OAuth

        private func isOAuthURL(_ url: URL) -> Bool {
            let s = url.absoluteString
            return s.contains("supabase.co/auth/v1/authorize") &&
                   (s.contains("provider=google") || s.contains("provider=apple"))
        }

        private func handleOAuthInSystemBrowser(url: URL) {
            guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else { return }

            // Replace redirect_to with custom scheme for native callback
            if let index = components.queryItems?.firstIndex(where: { $0.name == "redirect_to" }) {
                components.queryItems?[index] = URLQueryItem(
                    name: "redirect_to", value: AppConfig.oauthCallbackURL
                )
            } else {
                var items = components.queryItems ?? []
                items.append(URLQueryItem(name: "redirect_to", value: AppConfig.oauthCallbackURL))
                components.queryItems = items
            }

            guard let authURL = components.url else { return }

            let session = ASWebAuthenticationSession(
                url: authURL,
                callbackURLScheme: AppConfig.oauthCallbackScheme
            ) { [weak self] callbackURL, error in
                Task { @MainActor in
                    guard let self else { return }
                    if let callbackURL {
                        // Pass auth tokens/code back to the web app
                        let fragment = callbackURL.fragment ?? ""
                        let query = callbackURL.query ?? ""
                        var targetURL = AppConfig.baseURL
                        if !fragment.isEmpty {
                            targetURL += "#\(fragment)"
                        } else if !query.isEmpty {
                            targetURL += "?\(query)"
                        }
                        if let url = URL(string: targetURL) {
                            self.viewModel.webView?.load(URLRequest(url: url))
                        }
                    }
                    // Cancelled or error → user stays on login page
                }
            }

            session.presentationContextProvider = self
            session.prefersEphemeralWebBrowserSession = false
            self.authSession = session
            session.start()
        }

        // MARK: Helpers

        private func isInternalHost(_ host: String) -> Bool {
            host.contains("di-quest.netlify.app") ||
            host.contains("supabase.co") ||
            host.contains("localhost") ||
            host.contains("127.0.0.1")
        }

        private func handleError(_ error: Error) {
            let nsError = error as NSError
            guard nsError.code != NSURLErrorCancelled else { return }

            let message: String
            switch nsError.code {
            case NSURLErrorNotConnectedToInternet:
                message = "無網路連線，請檢查您的網路設定"
            case NSURLErrorTimedOut:
                message = "連線逾時，請稍後再試"
            case NSURLErrorCannotFindHost, NSURLErrorCannotConnectToHost:
                message = "無法連接到伺服器"
            default:
                message = "載入失敗：\(error.localizedDescription)"
            }
            viewModel.errorMessage = message
        }

        private func topViewController() -> UIViewController? {
            guard let scene = UIApplication.shared.connectedScenes
                .compactMap({ $0 as? UIWindowScene }).first,
                  let root = scene.windows.first?.rootViewController else { return nil }
            var vc = root
            while let presented = vc.presentedViewController { vc = presented }
            return vc
        }
    }
}

// MARK: - WebViewModel

@MainActor
final class WebViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var loadingProgress: Double = 0
    @Published var errorMessage: String?
    @Published var showSettings = false

    weak var webView: WKWebView?
    private var progressObserver: NSKeyValueObservation?

    func loadURL() {
        guard let url = URL(string: AppConfig.baseURL) else {
            errorMessage = "無效的 URL"
            return
        }
        webView?.load(URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData))
    }

    func reload() {
        errorMessage = nil
        if webView?.url != nil {
            webView?.reload()
        } else {
            loadURL()
        }
    }

    func setupProgressObserver() {
        progressObserver = webView?.observe(\.estimatedProgress, options: .new) { [weak self] webView, _ in
            Task { @MainActor in
                self?.loadingProgress = webView.estimatedProgress
            }
        }
    }
}

// MARK: - Color Extension

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        self.init(
            red: Double((rgb >> 16) & 0xFF) / 255,
            green: Double((rgb >> 8) & 0xFF) / 255,
            blue: Double(rgb & 0xFF) / 255
        )
    }
}
