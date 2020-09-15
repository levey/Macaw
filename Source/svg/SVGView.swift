import Foundation

#if os(iOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif

@objc open class SVGView: MacawView {

    @objc @IBInspectable open var fileName: String? {
        didSet {
            node = (try? SVGParser.parse(resource: fileName ?? "")) ?? Group()
        }
    }
    
    @objc @IBInspectable open var content: String? {
        didSet {
            node = (try? SVGParser.parse(text: content ?? "")) ?? Group()
        }
    }

    public init(node: Node, frame: CGRect) {
        super.init(frame: frame)
        self.node = node
    }

    @objc override public init?(node: Node, coder aDecoder: NSCoder) {
        super.init(node: node, coder: aDecoder)
    }

    required public convenience init?(coder aDecoder: NSCoder) {
        self.init(node: Group(), coder: aDecoder)
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func initializeView() {
        super.initializeView()
        self.contentLayout = ContentLayout.of(contentMode: contentMode)
    }

}
