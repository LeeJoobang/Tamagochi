import Foundation

struct TamagochiInfo{
    let tamagochi: [Tamagochi] = [
        Tamagochi.init(name: "따끔따끔 다마고치", image: "1-6", information: "고치는 아주 크지", statusMessage: "크자"),
        Tamagochi.init(name: "방실방실 다마고치", image: "2-6", information: "고치는 아주 빠르지", statusMessage: "배고파"),
        Tamagochi.init(name: "반짝반짝 다마고치", image: "1-6", information: "고치는 아주 느리지", statusMessage: "배불러"),
        ]
    
    static let statusMessage: [String] = ["a", "b", "c", "d", "e", "f", "g"]
}
