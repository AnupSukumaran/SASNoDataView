
import UIKit

public class SASNoData: NSObject {
    
    var mainView = UIView()
    var img = UIImage()
    var bgc: UIColor = .clear
    var imgClr: UIColor = .gray
    var setImgSize: CGFloat = 80
    var textSize: CGFloat = 20
    var textData: String = "NO DATA"
    var textColor: UIColor = .black
    
    public init(mainView: UIView, img: UIImage,textData: String = "NO DATA", bgc: UIColor = .white, imgClr: UIColor = .gray, setImgSize: CGFloat = 80, textSize: CGFloat = 20, textColor: UIColor = .black) {
        self.mainView = mainView
        self.img = img
        self.bgc = bgc
        self.imgClr = imgClr
        self.setImgSize = setImgSize
        self.textSize = textSize
        self.textData = textData
        self.textColor = textColor
    }
    
    public override init() {
        super.init()
    
    }
    

    public func noDataView(_ yes: Bool) {
        yes ? addSubview() : removeSubview()
    }
    
    
    
    func removeSubview() {
        mainView.subviews.forEach{$0.tag == 500 ? $0.removeFromSuperview():()}
    }
    
    
    func addSubview() {
        let noDataView = UIView()
        noDataView.tag = 500
        noDataView.frame = CGRect(x: 0, y: 0, width: mainView.frame.width, height: mainView.frame.height)
        noDataView.backgroundColor = bgc
        
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.tintColor = imgClr
        imgView.image = img
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = textData
        label.textAlignment = .center
        label.font = label.font.withSize(20)
        label.textColor = textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        noDataView.addSubview(imgView)
        noDataView.addSubview(label)
        mainView.addSubview(noDataView)
        
        
        
        NSLayoutConstraint(item: imgView, attribute: .centerX, relatedBy: .equal, toItem: noDataView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: imgView, attribute: .centerY, relatedBy: .equal, toItem: noDataView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: imgView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 80).isActive = true
        
        
        NSLayoutConstraint(item: imgView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 80).isActive = true
        
        
        NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: imgView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: imgView, attribute: .bottom, multiplier: 1, constant: 8).isActive = true
        
        NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: noDataView, attribute: .leading, multiplier: 1, constant: 8).isActive = true
        
        NSLayoutConstraint(item: label, attribute: .trailing, relatedBy: .equal, toItem: noDataView, attribute: .trailing, multiplier: 1, constant: -8).isActive = true
        
        
        
        
        
    }
    
    
    
    
}
