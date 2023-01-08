//
//  ViewController.swift
//  Practice-Flex-PinLayout
//
//  Created by 구본의 on 2023/01/08.
//

import UIKit
import PinLayout
import FlexLayout
import Then

// PinLayout
class ViewController: UIViewController {
  
  let label = UILabel().then {
    $0.text = "PinLayout"
    $0.backgroundColor = .blue
  }
  
  let firstLabel = UILabel().then {
    $0.text = "firstLabel"
    $0.backgroundColor = .yellow
    $0.textAlignment = .center
  }
  
  let secondLabel = UILabel().then {
    $0.text = "secondLabel"
    $0.backgroundColor = .red
    $0.textAlignment = .center
  }
  
  let thirdLabel = UILabel().then {
    $0.text = "thirdLabel"
    $0.backgroundColor = .green
    $0.textAlignment = .center
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("🔊[DEBUG]: ViewDidLoad - Called")
    view.backgroundColor = .white
  }
  
  /// PinLayout은 AutoLayout을 사용하지 않고 수동으로 view를 Layout하기 때문에
  /// UIView.layoutSubView(), 또는 UIViewController.viewDidLayoutSubviews() 내부에서 레이아웃을 업데이트 해야된다
  /// 즉 레이아웃을 설정하는 함수를 VC에서는 viewDidLayoutSubviews()에서 호출해줘야 한다.
  /// 만약 기존 AutoLayout을 사용할 때 처럼(ex. SnapKit) ViewDidLoad()에서 호출을 해준다면, 영역이 제대로 잡히지 않는다
  /// 대표적인 예가 viewDidLoad에서 호출한 경우 'safeArea'를 잡지못하고 전체 영역을 잡게 된다(superView영역)
  ///
  /// 또한 PinLayout은 몇가지 규칙이 있다.
  /// view.pin. [EDGE | ANCHOR | RELATIVE]. [WIDTH | HEIGHT | SIZE]. [pinEdges ()]. ​​[MARGINS]. [sizeToFit ()]
  /// 이 순서는 PinLayout 내부 로직을 반영하며, pinEdges()는 margins전에 적용되고, margins은 sizeToFit()전에 적용된다.
  ///
  /// 더불어 Edge를 주는 순서 또한 명시되어 있는데
  /// view.pin.top().bottom().left().right() 으로 구성해줘야 한다
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    self.setupLayout()
  }

  private func setupLayout() {
    self.view.addSubview(label)
    
    /// 아래 처럼 label의 레이아웃을 설정할 때 하나씩 설정하게 된다면,
    /// 레이아웃이 잡히지 않게 된다.
    /// 즉, label의 레이아웃을 잡기 위해서는 .으로 연결지어서 한번에 선언해야 된다.
//    label.pin.top(view.pin.safeArea)
//    label.pin.bottom(view.pin.safeArea)
//    label.pin.left().right()

    
    /// 옳바른 사용 방법
    /// 왜.. 바텀을 무조건 선언을 해줘야 하지..?
    /// 아래 예시에서 바텀을 선언해주지 않으면 레이아웃이 잡히지 않는다...
//    label.pin
//      .top(view.pin.safeArea)
//      .bottom(view.pin.safeArea)
//      .left().right()


    
    /// 하지만, 높이를 지정해 주면 레이아웃이 잡힌다
    /// UILabel의 intrinsic Size를 잡아주지 못하나..?
//    label.pin
//      .top(view.pin.safeArea)
//      .left().right()
//      .height(30)
    
    /// 사이즈는 잡아주는데...
//    print("🔊[DEBUG]: \(label.intrinsicContentSize)")
    
    /// 뷰의 가운데에 놓고 싶다면 vCenter()를 사용해주면 된다.
    /// 이때 동일하게 height를 잡아주지 않으면 레이아웃이 잡히지 않는다.
    /// 흠.................
    /// 추가로 view Hierarchy 까써 레이아웃을 확인할 수가 없다..ㅠ
//    label.pin
//      .left(20)
//      .right(20)
//      .vCenter()
//      .height(30)
    
    /// 만약에 크기를 못잡아 줘서 그런거라면..
    /// 크기를 잡아줘보자
    /// 추가로 특정 모서리에 붙이고 싶다면 아래처럼
//    label.pin
//      .top(view.pin.safeArea)
//      .right()
//      .size(100)
    
    /// 하지만 더 간단한 방법이 있다.
    /// 하지만 위 코드 처럼 safeArea.top에 붙이고 싶다고 아래 코드에 넣어주게 되면
    /// 에러가 발생한다.
//    label.pin
//      .topRight()
//      .size(100)
    
    
    // MARK: 여러 뷰를 사용할 때 특정 뷰 edge에 붙이기
    // offset(0)
    
    view.addSubview(firstLabel)
    view.addSubview(secondLabel)
    view.addSubview(thirdLabel)
    
    /// firstLabel을 기준으로 view를 구성해보자
    
    firstLabel.pin
      .top(view.pin.safeArea)
      .left()
      .size(100)
    
    /// 만약 top을 설정해주지 않으면, 붙기는 하지만, superView의 top으로 붙게 된다.
//    secondLabel.pin
//      .top(view.pin.safeArea)
//      .after(of: firstLabel)
//      .size(100)
    
    /// 마찬가지로 left()를 설정해 주지 않으면,
    /// secondLabel의 아래를 기준으로 잡았음에도
    /// 위치만 아래에 위치하게 되고, superView를 기준으로 왼쪽이 잡히게 된다
//    thirdLabel.pin
//      .below(of: secondLabel)
//      .size(150)
    
    /// 만약 secondLabel의 왼쪽
    /// 즉, leading을 맞추고 싶다면, alignment를 설정해 주면 된다
    /// trailing을 맞추고 싶을 때도 마찬가지
    /// 아래 코드는 trailing에 맞춘 코드
    
//    thirdLabel.pin
//      .below(of: secondLabel, aligned: .right)
//      .size(150)
    
    // MARK: 두 뷰 사이에 두기 Between
    
    secondLabel.pin
      .top(view.pin.safeArea)
      .right()
      .size(100)
    
    /// 이때도 마찬가지로 height값을 잡아줘야 하며
    /// alignment를 설정할 수 있다
    thirdLabel.pin
      .horizontallyBetween(firstLabel, and: secondLabel, aligned: .bottom)
      .height(30)
   
  }
  
}

