import SwiftUI
import UIKit

// MARK: - SwiftUI PerryView
struct PerryView: View {
    var body: some View {
        ZStack {
            // 背景顏色
            Color(red: 0.2, green: 0.6, blue: 0.6)
                .ignoresSafeArea()
            
            // Perry 的眼睛
            HStack { // 左右眼睛的距離設定
                // 左眼
                ZStack {
                    // 白色橢圓形眼睛，並添加黑色邊框
                    Ellipse()
                        .frame(width: 73, height: 58)
                        .foregroundColor(.white)
                        .overlay(
                            Ellipse()
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .rotationEffect(.degrees(20)) // 左眼旋轉 20 度

                    // 左眼黑色眼珠和白點
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                        .offset(x: -14, y: -10) // 調整眼珠位置
                    
                    Circle() // 白色高光
                        .frame(width: 10, height: 10)
                        .foregroundColor(.white)
                        .offset(x: -18, y: -13) // 調整白點位置
                }
                .offset(x: -20, y: -10) // 調整左眼位置
                
                // 右眼
                ZStack {
                    // 白色橢圓形眼睛，並添加黑色邊框
                    Ellipse()
                        .frame(width: 73, height: 58)
                        .foregroundColor(.white)
                        .overlay(
                            Ellipse()
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .rotationEffect(.degrees(20)) // 右眼旋轉 20 度
                    
                    // 右眼黑色眼珠和白點
                    Ellipse()
                        .frame(width: 37, height: 26)
                        .foregroundColor(.black)
                        .rotationEffect(.degrees(23)) // 旋轉黑色眼珠
                        .offset(x: 7, y: 5) // 調整眼珠位置
                    
                    Ellipse()
                        .frame(width: 10, height: 7)
                        .foregroundColor(.white)
                        .rotationEffect(.degrees(50)) // 旋轉白點
                        .offset(x: 14, y: 3) // 調整白點位置
                }
                .offset(x: 25, y: 20) // 調整右眼位置
            }
            .offset(y: -130) // 整體上移眼睛的位置
        }
    }
}

// UIKit 的 ViewController，負責繪製幾何圖形與貝茲曲線
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 繪製第一個三角形
        let firstTrianglePath = UIBezierPath()
        firstTrianglePath.move(to: CGPoint(x: 190, y: 330)) // 起點
        firstTrianglePath.addLine(to: CGPoint(x: 160, y: 390)) // 第二個點
        firstTrianglePath.addLine(to: CGPoint(x: 270, y: 420)) // 第三個點
        firstTrianglePath.close() // 關閉路徑形成三角形

        let firstTriangleLayer = CAShapeLayer()
        firstTriangleLayer.path = firstTrianglePath.cgPath // 路徑轉換為 CGPath
        firstTriangleLayer.lineWidth = 3 // 線條寬度
        firstTriangleLayer.fillColor = UIColor(red: 247/255.0, green: 174/255.0, blue: 69/255.0, alpha: 255.0).cgColor // 填充顏色
        view.layer.addSublayer(firstTriangleLayer) // 將圖層添加至視圖上
        
        // 繪製一條貝茲曲線
        let path = UIBezierPath()
        //填充色塊1
        let shape = UIBezierPath()
            path.move(to: CGPoint(x: 160, y: 390))
            path.addLine(to: CGPoint(x: 164, y: 385))
            path.addLine(to: CGPoint(x: 117, y: 365.5))
            path.addLine(to: CGPoint(x: 85, y: 370))
            path.addLine(to: CGPoint(x: 85, y: 396))
            path.addLine(to: CGPoint(x: 270, y: 420))

            path.close()
            
            let starLayer = CAShapeLayer()
            starLayer.path = path.cgPath
            starLayer.fillColor = UIColor(red: 247/255.0, green: 174/255.0, blue: 69/255.0, alpha: 255.0).cgColor // 填充顏色
            starLayer.lineWidth = 3
            view.layer.addSublayer(starLayer)
        
        path.move(to: CGPoint(x: 170, y: 390)) // 起點
        path.addQuadCurve(to: CGPoint(x: 115, y: 365), controlPoint: CGPoint(x: 145, y: 370)) // 曲線的終點與控制點

        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.lineWidth = 3
        layer.fillColor = UIColor(red: 247/255.0, green: 174/255.0, blue: 69/255.0, alpha: 255.0).cgColor // 填充顏色
        view.layer.addSublayer(layer) // 將圖層添加至視圖上
        
        // 第二條貝茲曲線
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: 115, y: 365)) // 起點
        path2.addQuadCurve(to: CGPoint(x: 85, y: 370), controlPoint: CGPoint(x: 100, y: 365)) // 曲線的終點和控制點
        
        let layer2 = CAShapeLayer()
        layer2.path = path2.cgPath
        layer2.lineWidth = 3
        layer2.strokeColor = UIColor(red: 225/255.0, green: 142/255.0, blue: 50/255.0, alpha: 255.0).cgColor
        layer2.fillColor = UIColor(red: 247/255.0, green: 174/255.0, blue: 69/255.0, alpha: 255.0).cgColor // 填充顏色
        view.layer.addSublayer(layer2)
        
        // 第三條貝茲曲線
        let path3 = UIBezierPath()
        path3.move(to: CGPoint(x: 85, y: 370)) // 起點
        path3.addQuadCurve(to: CGPoint(x: 85, y: 396), controlPoint: CGPoint(x: 70, y: 383)) // 曲線的終點和控制點
        
        let layer3 = CAShapeLayer()
        layer3.path = path3.cgPath
        layer3.lineWidth = 3
        layer3.strokeColor = UIColor(red: 225/255.0, green: 142/255.0, blue: 50/255.0, alpha: 255.0).cgColor
        layer3.fillColor = UIColor(red: 247/255.0, green: 174/255.0, blue: 69/255.0, alpha: 255.0).cgColor // 填充顏色
        view.layer.addSublayer(layer3)
        
        // 第四條貝茲曲線
        let path4 = UIBezierPath()
        path4.move(to: CGPoint(x: 85, y: 396)) // 起點
        path4.addQuadCurve(to: CGPoint(x: 165, y: 405), controlPoint: CGPoint(x: 125, y: 410)) // 曲線的終點和控制點
        
        let layer4 = CAShapeLayer()
        layer4.path = path4.cgPath
        layer4.lineWidth = 3
        layer4.strokeColor = UIColor(red: 225/255.0, green: 142/255.0, blue: 50/255.0, alpha: 255.0).cgColor
        layer4.fillColor = UIColor(red: 247/255.0, green: 174/255.0, blue: 69/255.0, alpha: 255.0).cgColor // 填充顏色
        view.layer.addSublayer(layer4)
        
        // 第五條貝茲曲線
        let path5 = UIBezierPath()
        path5.move(to: CGPoint(x: 165, y: 405)) // 起點
        path5.addQuadCurve(to: CGPoint(x: 270, y: 420), controlPoint: CGPoint(x: 185, y: 440)) // 曲線的終點和控制點
        
        let layer5 = CAShapeLayer()
        layer5.path = path5.cgPath
        layer5.lineWidth = 3
        layer5.strokeColor = UIColor(red: 225/255.0, green: 142/255.0, blue: 50/255.0, alpha: 255.0).cgColor
        layer5.fillColor = UIColor(red: 247/255.0, green: 174/255.0, blue: 69/255.0, alpha: 255.0).cgColor // 填充顏色
        view.layer.addSublayer(layer5)
        
        // 第六條貝茲曲線
        let path6 = UIBezierPath()
        path6.move(to: CGPoint(x: 170, y: 390)) // 起點
        path6.addQuadCurve(to: CGPoint(x: 115, y: 365), controlPoint: CGPoint(x: 145, y: 370)) // 曲線的終點與控制點

        let layer6 = CAShapeLayer()
        layer6.path = path6.cgPath
        layer6.lineWidth = 3
        layer6.strokeColor = UIColor(red: 225/255.0, green: 142/255.0, blue: 50/255.0, alpha: 255.0).cgColor
        layer6.fillColor = UIColor(red: 247/255.0, green: 174/255.0, blue: 69/255.0, alpha: 255.0).cgColor // 填充顏色
        view.layer.addSublayer(layer6)
        
        // 第七條貝茲曲線
        let path7 = UIBezierPath()
        path7.move(to: CGPoint(x: 190, y: 330)) // 起點
        path7.addQuadCurve(to: CGPoint(x: 163, y: 384), controlPoint: CGPoint(x: 170, y: 370)) // 曲線的終點與控制點

        
        let layer7 = CAShapeLayer()
        layer7.path = path7.cgPath
        layer7.lineWidth = 3
        layer7.strokeColor = UIColor(red: 225/255.0, green: 142/255.0, blue: 50/255.0, alpha: 255.0).cgColor
        layer7.fillColor = UIColor(red: 247/255.0, green: 174/255.0, blue: 69/255.0, alpha: 255.0).cgColor // 填充顏色
        view.layer.addSublayer(layer7)
        
        // 第八條貝茲曲線
        let path8 = UIBezierPath()
        path8.move(to: CGPoint(x: 190, y: 330)) // 起點
        path8.addQuadCurve(to: CGPoint(x: 270, y: 420), controlPoint: CGPoint(x: 225, y: 370)) // 曲線的終點與控制點

        
        let layer8 = CAShapeLayer()
        layer8.path = path8.cgPath
        layer8.lineWidth = 3
        layer8.strokeColor = UIColor(red: 225/255.0, green: 142/255.0, blue: 50/255.0, alpha: 255.0).cgColor
        layer8.fillColor = UIColor(red: 247/255.0, green: 174/255.0, blue: 69/255.0, alpha: 255.0).cgColor // 填充顏色
        view.layer.addSublayer(layer8)
        
        // 第九條貝茲曲線
        let path9 = UIBezierPath()
        path9.move(to: CGPoint(x: 165, y: 408)) // 起點
        path9.addQuadCurve(to: CGPoint(x: 250, y: 412), controlPoint: CGPoint(x: 190, y: 403)) // 曲線的終點與控制點

        let layer9 = CAShapeLayer()
        layer9.path = path9.cgPath
        layer9.lineWidth = 2
        layer9.strokeColor = UIColor.black.cgColor // Set the line color to black
        layer9.fillColor = UIColor.clear.cgColor   // Ensure the shape is not filled

        view.layer.addSublayer(layer9)


        
    }
}

// 使用 UIViewControllerRepresentable 將 UIKit 的 ViewController 包裝成 SwiftUI 視圖
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController() // 返回自定義 ViewController
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        // 通常不需更新內容
    }
}

// 結合 SwiftUI 與 UIKit 的視圖
struct CombinedView: View {
    var body: some View {
        ZStack {
            PerryView() // SwiftUI 視圖，負責 Perry 的視覺
            ViewControllerRepresentable() // UIKit 視圖，負責貝茲曲線
                .ignoresSafeArea() // 讓視圖忽略安全區域
        }
    }
}



// MARK: - Preview
#Preview {
    CombinedView()
}
