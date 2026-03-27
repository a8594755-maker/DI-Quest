import WebKit
import UIKit

final class NativeBridge: NSObject, WKScriptMessageHandler {
    weak var webView: WKWebView?
    var onOpenSettings: (() -> Void)?

    private static let handlerNames = ["haptic", "share", "openSettings", "biometricAuth"]

    func register(on controller: WKUserContentController) {
        for name in Self.handlerNames {
            controller.add(self, name: name)
        }
    }

    func unregister(from controller: WKUserContentController) {
        for name in Self.handlerNames {
            controller.removeScriptMessageHandler(forName: name)
        }
    }

    // MARK: - WKScriptMessageHandler

    func userContentController(
        _ userContentController: WKUserContentController,
        didReceive message: WKScriptMessage
    ) {
        let body = message.body as? [String: Any] ?? [:]

        switch message.name {
        case "haptic":
            let type = body["type"] as? String ?? "light"
            HapticService.trigger(type)

        case "share":
            handleShare(body)

        case "openSettings":
            onOpenSettings?()

        case "biometricAuth":
            let reason = body["reason"] as? String ?? "驗證身分以繼續"
            handleBiometricAuth(reason: reason)

        default:
            break
        }
    }

    // MARK: - Share

    private func handleShare(_ body: [String: Any]) {
        var items: [Any] = []
        if let text = body["text"] as? String { items.append(text) }
        if let urlString = body["url"] as? String, let url = URL(string: urlString) {
            items.append(url)
        }
        guard !items.isEmpty else { return }

        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)

        guard let presenter = topViewController() else { return }

        // iPad requires sourceView for popover
        if let popover = activityVC.popoverPresentationController {
            popover.sourceView = presenter.view
            popover.sourceRect = CGRect(
                x: presenter.view.bounds.midX,
                y: presenter.view.bounds.midY,
                width: 0, height: 0
            )
            popover.permittedArrowDirections = []
        }

        presenter.present(activityVC, animated: true)
    }

    // MARK: - Biometric Auth

    private func handleBiometricAuth(reason: String) {
        Task { @MainActor in
            let success = await BiometricAuthService.authenticate(reason: reason)
            let js = "window.__DI_QUEST_BRIDGE__?.onBiometricResult?.({ success: \(success) })"
            _ = try? await webView?.evaluateJavaScript(js)
        }
    }

    // MARK: - Helpers

    private func topViewController() -> UIViewController? {
        guard let scene = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene }).first,
              let root = scene.windows.first?.rootViewController else { return nil }
        var vc = root
        while let presented = vc.presentedViewController { vc = presented }
        return vc
    }
}
