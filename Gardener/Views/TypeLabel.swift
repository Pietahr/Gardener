import UIKit

class TypeLabel: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.createCustomView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createCustomView()
    }
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: 0, left: 8, bottom: 0, right: 8)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
    private func createCustomView() {
        self.layer.cornerRadius = 10
        self.textColor = UIColor.white
    }
}
