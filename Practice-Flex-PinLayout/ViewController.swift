//
//  ViewController.swift
//  Practice-Flex-PinLayout
//
//  Created by ๊ตฌ๋ณธ์ on 2023/01/08.
//

import UIKit
import PinLayout
import FlexLayout
import Then

// PinLayout
//class ViewController: UIViewController {
//
//  let label = UILabel().then {
//    $0.text = "PinLayout"
//    $0.backgroundColor = .blue
//  }
//
//  let firstLabel = UILabel().then {
//    $0.text = "firstLabel"
//    $0.backgroundColor = .yellow
//    $0.textAlignment = .center
//  }
//
//  let secondLabel = UILabel().then {
//    $0.text = "secondLabel"
//    $0.backgroundColor = .red
//    $0.textAlignment = .center
//  }
//
//  let thirdLabel = UILabel().then {
//    $0.text = "thirdLabel"
//    $0.backgroundColor = .green
//    $0.textAlignment = .center
//  }
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    print("๐[DEBUG]: ViewDidLoad - Called")
//    view.backgroundColor = .white
//  }
//
//  /// PinLayout์ AutoLayout์ ์ฌ์ฉํ์ง ์๊ณ  ์๋์ผ๋ก view๋ฅผ Layoutํ๊ธฐ ๋๋ฌธ์
//  /// UIView.layoutSubView(), ๋๋ UIViewController.viewDidLayoutSubviews() ๋ด๋ถ์์ ๋ ์ด์์์ ์๋ฐ์ดํธ ํด์ผ๋๋ค
//  /// ์ฆ ๋ ์ด์์์ ์ค์ ํ๋ ํจ์๋ฅผ VC์์๋ viewDidLayoutSubviews()์์ ํธ์ถํด์ค์ผ ํ๋ค.
//  /// ๋ง์ฝ ๊ธฐ์กด AutoLayout์ ์ฌ์ฉํ  ๋ ์ฒ๋ผ(ex. SnapKit) ViewDidLoad()์์ ํธ์ถ์ ํด์ค๋ค๋ฉด, ์์ญ์ด ์ ๋๋ก ์กํ์ง ์๋๋ค
//  /// ๋ํ์ ์ธ ์๊ฐ viewDidLoad์์ ํธ์ถํ ๊ฒฝ์ฐ 'safeArea'๋ฅผ ์ก์ง๋ชปํ๊ณ  ์ ์ฒด ์์ญ์ ์ก๊ฒ ๋๋ค(superView์์ญ)
//  ///
//  /// ๋ํ PinLayout์ ๋ช๊ฐ์ง ๊ท์น์ด ์๋ค.
//  /// view.pin. [EDGE | ANCHOR | RELATIVE]. [WIDTH | HEIGHT | SIZE]. [pinEdges ()]. โโ[MARGINS]. [sizeToFit ()]
//  /// ์ด ์์๋ PinLayout ๋ด๋ถ ๋ก์ง์ ๋ฐ์ํ๋ฉฐ, pinEdges()๋ margins์ ์ ์ ์ฉ๋๊ณ , margins์ sizeToFit()์ ์ ์ ์ฉ๋๋ค.
//  ///
//  /// ๋๋ถ์ด Edge๋ฅผ ์ฃผ๋ ์์ ๋ํ ๋ช์๋์ด ์๋๋ฐ
//  /// view.pin.top().bottom().left().right() ์ผ๋ก ๊ตฌ์ฑํด์ค์ผ ํ๋ค
//  override func viewDidLayoutSubviews() {
//    super.viewDidLayoutSubviews()
//    self.setupLayout()
//  }
//
//  private func setupLayout() {
//    self.view.addSubview(label)
//
//    /// ์๋ ์ฒ๋ผ label์ ๋ ์ด์์์ ์ค์ ํ  ๋ ํ๋์ฉ ์ค์ ํ๊ฒ ๋๋ค๋ฉด,
//    /// ๋ ์ด์์์ด ์กํ์ง ์๊ฒ ๋๋ค.
//    /// ์ฆ, label์ ๋ ์ด์์์ ์ก๊ธฐ ์ํด์๋ .์ผ๋ก ์ฐ๊ฒฐ์ง์ด์ ํ๋ฒ์ ์ ์ธํด์ผ ๋๋ค.
////    label.pin.top(view.pin.safeArea)
////    label.pin.bottom(view.pin.safeArea)
////    label.pin.left().right()
//
//
//    /// ์ณ๋ฐ๋ฅธ ์ฌ์ฉ ๋ฐฉ๋ฒ
//    /// ์.. ๋ฐํ์ ๋ฌด์กฐ๊ฑด ์ ์ธ์ ํด์ค์ผ ํ์ง..?
//    /// ์๋ ์์์์ ๋ฐํ์ ์ ์ธํด์ฃผ์ง ์์ผ๋ฉด ๋ ์ด์์์ด ์กํ์ง ์๋๋ค...
////    label.pin
////      .top(view.pin.safeArea)
////      .bottom(view.pin.safeArea)
////      .left().right()
//
//
//
//    /// ํ์ง๋ง, ๋์ด๋ฅผ ์ง์ ํด ์ฃผ๋ฉด ๋ ์ด์์์ด ์กํ๋ค
//    /// UILabel์ intrinsic Size๋ฅผ ์ก์์ฃผ์ง ๋ชปํ๋..?
////    label.pin
////      .top(view.pin.safeArea)
////      .left().right()
////      .height(30)
//
//    /// ์ฌ์ด์ฆ๋ ์ก์์ฃผ๋๋ฐ...
////    print("๐[DEBUG]: \(label.intrinsicContentSize)")
//
//    /// ๋ทฐ์ ๊ฐ์ด๋ฐ์ ๋๊ณ  ์ถ๋ค๋ฉด vCenter()๋ฅผ ์ฌ์ฉํด์ฃผ๋ฉด ๋๋ค.
//    /// ์ด๋ ๋์ผํ๊ฒ height๋ฅผ ์ก์์ฃผ์ง ์์ผ๋ฉด ๋ ์ด์์์ด ์กํ์ง ์๋๋ค.
//    /// ํ .................
//    /// ์ถ๊ฐ๋ก view Hierarchy ๊น์จ ๋ ์ด์์์ ํ์ธํ  ์๊ฐ ์๋ค..ใ 
////    label.pin
////      .left(20)
////      .right(20)
////      .vCenter()
////      .height(30)
//
//    /// ๋ง์ฝ์ ํฌ๊ธฐ๋ฅผ ๋ชป์ก์ ์ค์ ๊ทธ๋ฐ๊ฑฐ๋ผ๋ฉด..
//    /// ํฌ๊ธฐ๋ฅผ ์ก์์ค๋ณด์
//    /// ์ถ๊ฐ๋ก ํน์  ๋ชจ์๋ฆฌ์ ๋ถ์ด๊ณ  ์ถ๋ค๋ฉด ์๋์ฒ๋ผ
////    label.pin
////      .top(view.pin.safeArea)
////      .right()
////      .size(100)
//
//    /// ํ์ง๋ง ๋ ๊ฐ๋จํ ๋ฐฉ๋ฒ์ด ์๋ค.
//    /// ํ์ง๋ง ์ ์ฝ๋ ์ฒ๋ผ safeArea.top์ ๋ถ์ด๊ณ  ์ถ๋ค๊ณ  ์๋ ์ฝ๋์ ๋ฃ์ด์ฃผ๊ฒ ๋๋ฉด
//    /// ์๋ฌ๊ฐ ๋ฐ์ํ๋ค.
////    label.pin
////      .topRight()
////      .size(100)
//
//
//    // MARK: ์ฌ๋ฌ ๋ทฐ๋ฅผ ์ฌ์ฉํ  ๋ ํน์  ๋ทฐ edge์ ๋ถ์ด๊ธฐ
//    // offset(0)
//
//    view.addSubview(firstLabel)
//    view.addSubview(secondLabel)
//    view.addSubview(thirdLabel)
//
//    /// firstLabel์ ๊ธฐ์ค์ผ๋ก view๋ฅผ ๊ตฌ์ฑํด๋ณด์
//
//    firstLabel.pin
//      .top(view.pin.safeArea)
//      .left()
//      .size(100)
//
//    /// ๋ง์ฝ top์ ์ค์ ํด์ฃผ์ง ์์ผ๋ฉด, ๋ถ๊ธฐ๋ ํ์ง๋ง, superView์ top์ผ๋ก ๋ถ๊ฒ ๋๋ค.
////    secondLabel.pin
////      .top(view.pin.safeArea)
////      .after(of: firstLabel)
////      .size(100)
//
//    /// ๋ง์ฐฌ๊ฐ์ง๋ก left()๋ฅผ ์ค์ ํด ์ฃผ์ง ์์ผ๋ฉด,
//    /// secondLabel์ ์๋๋ฅผ ๊ธฐ์ค์ผ๋ก ์ก์์์๋
//    /// ์์น๋ง ์๋์ ์์นํ๊ฒ ๋๊ณ , superView๋ฅผ ๊ธฐ์ค์ผ๋ก ์ผ์ชฝ์ด ์กํ๊ฒ ๋๋ค
////    thirdLabel.pin
////      .below(of: secondLabel)
////      .size(150)
//
//    /// ๋ง์ฝ secondLabel์ ์ผ์ชฝ
//    /// ์ฆ, leading์ ๋ง์ถ๊ณ  ์ถ๋ค๋ฉด, alignment๋ฅผ ์ค์ ํด ์ฃผ๋ฉด ๋๋ค
//    /// trailing์ ๋ง์ถ๊ณ  ์ถ์ ๋๋ ๋ง์ฐฌ๊ฐ์ง
//    /// ์๋ ์ฝ๋๋ trailing์ ๋ง์ถ ์ฝ๋
//
////    thirdLabel.pin
////      .below(of: secondLabel, aligned: .right)
////      .size(150)
//
//    // MARK: ๋ ๋ทฐ ์ฌ์ด์ ๋๊ธฐ Between
//
//    secondLabel.pin
//      .top(view.pin.safeArea)
//      .right()
//      .size(100)
//
//    /// ์ด๋๋ ๋ง์ฐฌ๊ฐ์ง๋ก height๊ฐ์ ์ก์์ค์ผ ํ๋ฉฐ
//    /// alignment๋ฅผ ์ค์ ํ  ์ ์๋ค
//    thirdLabel.pin
//      .horizontallyBetween(firstLabel, and: secondLabel, aligned: .bottom)
//      .height(30)
//
//  }
//
//}
//

class ViewController: UIViewController {
  
  private let rootFlexContainer = UIView().then {
    $0.backgroundColor = .cyan
  }
  
  private let logoImage = UIImageView().then {
    $0.image = UIImage(named: "siba")
    $0.contentMode = .scaleAspectFit
  }
  
  private let segmentedControl = UISegmentedControl(items: ["Intro", "FlexLayout", "PinLayout"]).then {
    $0.selectedSegmentIndex = 0
  }
  
  private let label = UILabel().then {
    $0.text = "Flexbox layouting is simple, powerfull and fast.\n\nFlexLayout syntax is concise and chainable."
    $0.numberOfLines = 0
  }
  
  private let bottomLabel = UILabel().then {
    $0.text = "FlexLayout/yoga is incredibly fast, its even faster than manual layout."
    $0.numberOfLines = 0
  }
  
  override func viewDidLoad() {
    self.view.backgroundColor = .white
    super.viewDidLoad()
    print("๐[DEBUG]: ViewDidLoad")
    
    view.addSubview(rootFlexContainer)
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    // ์ปจํ์ด๋์์ ์์ ์ถ๊ฐํ๋ ๊ฑฐ๋ viewDid์์ ํด๋ ์๊ด์ด ์๋ค...
    rootFlexContainer.flex.direction(.column).padding(12).define { flex in
      flex.addItem().direction(.row).define { flex in
        flex.addItem(logoImage).size(100).aspectRatio(of: logoImage)
        flex.addItem().direction(.column).paddingLeft(12).grow(1).shrink(1).define { flex in
          flex.addItem(segmentedControl).marginBottom(12).grow(1)
          flex.addItem(label)
        }
      }
      flex.addItem().height(1).marginTop(12).backgroundColor(.lightGray)
      flex.addItem(bottomLabel).margin(12)
    }
    
    rootFlexContainer.pin.top().bottom().horizontally().margin(view.pin.safeArea)
    rootFlexContainer.flex.layout(mode: .adjustHeight)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
   
    
  }
}
