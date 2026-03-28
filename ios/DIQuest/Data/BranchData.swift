import Foundation

enum BranchData {
    static let allBranches: [Branch] = [
        Branch(
            id: "business-analysis",
            name: "商業分析路線",
            nameEn: "Business Analysis",
            emoji: "🎯",
            description: "從問題拆解到完整商業 Case Study 面試準備",
            descriptionEn: "From problem breakdown to complete business case study interview prep",
            worldIds: [1, 2, 3, 5, 6, 7, 8, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 42]
        ),
        Branch(
            id: "sql",
            name: "SQL 路線",
            nameEn: "SQL",
            emoji: "🗄️",
            description: "SQL 查詢思維與實戰練習",
            descriptionEn: "SQL query thinking and hands-on practice",
            worldIds: [4, 23, 24, 25, 26]
        ),
        Branch(
            id: "python",
            name: "Python 路線",
            nameEn: "Python",
            emoji: "🐍",
            description: "Python 基礎、Pandas 數據處理、面試題",
            descriptionEn: "Python basics, Pandas data processing, interview questions",
            worldIds: [15, 16, 17, 18, 19, 20, 21, 22]
        ),
        Branch(
            id: "di-product",
            name: "DI 產品知識路線",
            nameEn: "DI Product Knowledge",
            emoji: "🏢",
            description: "Decision Intelligence 產品架構、部署、品質與邊界",
            descriptionEn: "Decision Intelligence product architecture, deployment, quality & boundaries",
            worldIds: [9, 10, 11, 12, 13, 14, 39, 40, 41]
        ),
        Branch(
            id: "professional-english",
            name: "職場英文路線",
            nameEn: "Professional English",
            emoji: "🌐",
            description: "從專案介紹到面試對答，練出職場即戰力英文",
            descriptionEn: "From project introductions to interview conversations, build workplace English skills",
            worldIds: [48, 49, 50, 51, 52, 53],
            zhOnly: true
        ),
        Branch(
            id: "supply-chain",
            name: "供應鏈管理路線",
            nameEn: "Supply Chain Management",
            emoji: "🔗",
            description: "從供應鏈全貌到風險永續，掌握 Supply Chain + Data + IT 的核心競爭力",
            descriptionEn: "From supply chain overview to risk & sustainability, master Supply Chain + Data + IT core competencies",
            worldIds: [54, 55, 56, 57, 58, 59, 60, 61]
        ),
    ]

    static func branch(for id: String) -> Branch? {
        allBranches.first { $0.id == id }
    }

    static func branchForWorld(_ worldId: Int) -> Branch? {
        allBranches.first { $0.worldIds.contains(worldId) }
    }
}
