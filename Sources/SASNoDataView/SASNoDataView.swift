
import UIKit
import SASStringAttributePack
import SASLogger

public enum NoDataViewForm {
    case imageAndLabel
    case imageLabelsBtn
    case imageLabelsBtns
}

public class SASNoData: NSObject {
    
    var mainView = UIView()
    var img = UIImage()
    var bgc: UIColor = .clear
    var imgClr: UIColor = .gray
    var setImgSize: CGFloat = 80
    var textSize: CGFloat = 20
    var textData: String = "NO DATA"
    var subTextData: String = ""
    var textColor: UIColor = .black
    var btnActionComp: (() -> ())?
    var wishListActionComp: (() -> ())?
    var noDataForm: NoDataViewForm = .imageAndLabel
    
    public init(mainView: UIView, img: UIImage,textData: String = "NO DATA",subTextData: String = "", bgc: UIColor = .white, imgClr: UIColor = .clear, setImgSize: CGFloat = 80, textSize: CGFloat = 20, textColor: UIColor = .black, btnActionComp: (() -> ())? = nil, wishListActionComp: (() -> ())? = nil, noDataForm: NoDataViewForm = .imageAndLabel) {
        self.mainView = mainView
        self.img = img
        self.bgc = bgc
        self.imgClr = imgClr
        self.setImgSize = setImgSize
        self.textSize = textSize
        self.textData = textData
        self.textColor = textColor
        self.btnActionComp = btnActionComp
        self.wishListActionComp = wishListActionComp
        self.noDataForm = noDataForm
        self.subTextData = subTextData
    }
    
    public override init() {
        super.init()
    
    }

    public func noDataView(_ yes: Bool) {
        var function: () = ()
    
        switch noDataForm {
        case .imageAndLabel:
            function = addSubview()
        case .imageLabelsBtn:
            function = noItemsInCart()
        case .imageLabelsBtns:
            function = noItemsInWishList()
        }
        
        yes ? function : removeSubview()
    }
    
    func removeSubview() {
        mainView.subviews.forEach{$0.tag == 500 ? $0.removeFromSuperview():()}
    }
    
    
    func addSubview() {
        let onView = UIView()
        onView.tag = 500
        onView.frame = CGRect(x: 0, y: 0, width: mainView.frame.width, height: mainView.frame.height)
        onView.backgroundColor = bgc
        
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.tintColor = imgClr
        imgView.image = img
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = textData
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        
        onView.addSubview(imgView)
        onView.addSubview(label)
        mainView.addSubview(onView)
        
        constraintsForImgView(firstView: imgView, onView: onView, centerY: 0.8, height: setImgSize, width: setImgSize)
        constraintsForLabelView(firstView: label, secondView: imgView, onView, topDistance: 8)
 
        
    }
    
    func noItemsInCart() {
        let onView = UIView()
        onView.tag = 500
        onView.frame = CGRect(x: 0, y: 0, width: mainView.frame.width, height: mainView.frame.height)
        onView.backgroundColor = bgc
        
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.tintColor = imgClr
        imgView.image = img
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = textData
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let label2 = UILabel()
        label2.text = subTextData
        label2.textAlignment = .center
        label2.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label2.font = label.font.withSize(15)
        label2.translatesAutoresizingMaskIntoConstraints = false
        
        let btn = UIButton()
        btn.setTitle("Shop Now", for: .normal)
        btn.titleLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        btn.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        btn.layer.cornerRadius = 4
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        onView.addSubview(imgView)
        onView.addSubview(label)
        onView.addSubview(label2)
        onView.addSubview(btn)
        mainView.addSubview(onView)
        
        constraintsForImgView(firstView: imgView, onView: onView, centerY: 0.65, height: setImgSize, width: setImgSize)
        constraintsForLabelView(firstView: label, secondView: imgView, onView, topDistance: 10)
        constraintsForLabelView(firstView: label2, secondView: label, onView, topDistance: 18)
        constraintsForBtnView(firstView: btn, secondView: label2, topDistance: 35, height: 40, width: 100)
  
    }
    
    func noItemsInWishList() {
          let onView = UIView()
          onView.tag = 500
          onView.frame = CGRect(x: 0, y: 0, width: mainView.frame.width, height: mainView.frame.height)
          onView.backgroundColor = bgc
          
          let imgView = UIImageView()
          imgView.contentMode = .scaleAspectFit
          imgView.tintColor = imgClr
          imgView.image = img
          imgView.translatesAutoresizingMaskIntoConstraints = false
          
          let label = UILabel()
          label.text = textData
          label.font = UIFont.boldSystemFont(ofSize: 20)
          label.textAlignment = .center
          label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
          label.translatesAutoresizingMaskIntoConstraints = false
          
          let label2 = UILabel()
          label2.text = subTextData
          label2.textAlignment = .center
          label2.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
          label2.font = label.font.withSize(15)
          label2.translatesAutoresizingMaskIntoConstraints = false
          
          let btn = UIButton()
          btn.setTitle("Login", for: .normal)
          btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
          btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
          btn.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
          btn.layer.cornerRadius = 4
          btn.translatesAutoresizingMaskIntoConstraints = false
        
        let continueBtn = UIButton()
        continueBtn.setTitle("Continue Shopping", for: .normal)
        continueBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        continueBtn.setTitleColor(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), for: .normal)
        continueBtn.addTarget(self, action: #selector(continueAction), for: .touchUpInside)
        continueBtn.backgroundColor = .clear
        continueBtn.translatesAutoresizingMaskIntoConstraints = false
          
          onView.addSubview(imgView)
          onView.addSubview(label)
          onView.addSubview(label2)
          onView.addSubview(btn)
       
          onView.addSubview(continueBtn)
          mainView.addSubview(onView)
          
          constraintsForImgView(firstView: imgView, onView: onView, centerY: 0.65, height: setImgSize, width: setImgSize)
          constraintsForLabelView(firstView: label, secondView: imgView, onView, topDistance: 10)
          constraintsForLabelView(firstView: label2, secondView: label, onView, topDistance: 18)
          constraintsForBtnView(firstView: btn, secondView: label2, topDistance: 35, height: 40, width: 100)
          constraintsForBtnView(firstView: continueBtn, secondView: btn, topDistance: 16, height: 40, width: 150)
      }
    
    @objc func btnAction() {
        Logger.p("BtnAction")
        btnActionComp?()
    }
    
    @objc func continueAction() {
        Logger.p("continueAction")
        wishListActionComp?()
    }
    
    
    func constraintsForImgView( firstView: UIView, onView: UIView, centerY: CGFloat, height: CGFloat, width: CGFloat) {
        NSLayoutConstraint(item: firstView, attribute: .centerX, relatedBy: .equal, toItem: onView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: firstView, attribute: .centerY, relatedBy: .equal, toItem: onView, attribute: .centerY, multiplier: centerY, constant: 0).isActive = true
        
        NSLayoutConstraint(item: firstView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: width).isActive = true
        
        NSLayoutConstraint(item: firstView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: height).isActive = true
    }
    
    func constraintsForBtnView( firstView: UIView, secondView: UIView, topDistance: CGFloat, height: CGFloat, width: CGFloat) {
        NSLayoutConstraint(item: firstView, attribute: .centerX, relatedBy: .equal, toItem: secondView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: firstView, attribute: .top, relatedBy: .equal, toItem: secondView, attribute: .bottom, multiplier: 1, constant: topDistance).isActive = true
        
        NSLayoutConstraint(item: firstView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: width).isActive = true
        
        NSLayoutConstraint(item: firstView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: height).isActive = true
    }
    
    func constraintsForLabelView( firstView: UILabel, secondView: UIView, _ onView: UIView, topDistance: CGFloat) {
        NSLayoutConstraint(item: firstView, attribute: .centerX, relatedBy: .equal, toItem: secondView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: firstView, attribute: .top, relatedBy: .equal, toItem: secondView, attribute: .bottom, multiplier: 1, constant: topDistance).isActive = true
        
        NSLayoutConstraint(item: firstView, attribute: .leading, relatedBy: .equal, toItem: onView, attribute: .leading, multiplier: 1, constant: 8).isActive = true
        
        NSLayoutConstraint(item: firstView, attribute: .trailing, relatedBy: .equal, toItem: onView, attribute: .trailing, multiplier: 1, constant: -8).isActive = true
    }
    
}
