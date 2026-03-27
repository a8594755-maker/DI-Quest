import WebKit

@MainActor
final class CacheService: ObservableObject {
    @Published var cacheSize: String = "計算中..."

    func calculateCacheSize() async {
        let cacheURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        var size: Int64 = 0
        if let cacheURL {
            let enumerator = FileManager.default.enumerator(
                at: cacheURL,
                includingPropertiesForKeys: [.fileSizeKey]
            )
            while let fileURL = enumerator?.nextObject() as? URL {
                let attrs = try? fileURL.resourceValues(forKeys: [.fileSizeKey])
                size += Int64(attrs?.fileSize ?? 0)
            }
        }
        cacheSize = ByteCountFormatter.string(fromByteCount: size, countStyle: .file)
    }

    func clearCache() async {
        let types = WKWebsiteDataStore.allWebsiteDataTypes()
        await WKWebsiteDataStore.default().removeData(
            ofTypes: types,
            modifiedSince: Date(timeIntervalSince1970: 0)
        )
        await calculateCacheSize()
    }
}
