import Cocoa

struct Position {
    var x:Int = 0
    var y:Int = 0
    
    init() {}
    init(_ x:Int, _ y:Int) { self.x = x; self.y = y }
    func cgPoint() -> CGPoint { return CGPoint(x:x, y:y) }
    
    static func + (left: Position, right: Position) -> Position { return Position(left.x + right.x, left.y + right.y) }
    static func += (left: inout Position, right: Position) { left = left + right }
}

var context = NSGraphicsContext.current()?.cgContext
let colorWhite = NSColor(red:1, green:1, blue:1, alpha:1).cgColor
let colorYellow = NSColor(red:1, green:1, blue:0, alpha:1).cgColor
let colorDarkRed = NSColor(red:0.25, green:0, blue:0, alpha:1).cgColor
let colorBlue = NSColor(red:0, green:0.3, blue:1, alpha:1).cgColor
let colorRed = NSColor(red:0.75, green:0.1, blue:0, alpha:1).cgColor
let colorLightRed = NSColor(red:0.75, green:0.4, blue:0, alpha:1).cgColor
let colorLightBlue = NSColor(red:0.6, green:0.6, blue:1, alpha:1).cgColor
let colorGreen = NSColor(red:0, green:0.75, blue:0, alpha:1).cgColor
let colorPink = NSColor(red:0.7, green:0.3, blue:0.6, alpha:1).cgColor
let colorBlack = NSColor(red:0, green:0, blue:0, alpha:1).cgColor
let colorNearBlack = NSColor(red:0.2, green:0.2, blue:0.04, alpha:1).cgColor
let colorGray0 = NSColor(red:0.3, green:0.3, blue:0.5, alpha:1).cgColor

let font = NSFont.init(name: "Helvetica", size: 10)!
let atts = [NSFontAttributeName:font] // , NSForegroundColorAttributeName:NSColor(red:1, green:1, blue:1, alpha:1)]

func drawString(_ str:String, _ x:Int, _ y:Int) {
	let pt = NSMakePoint(CGFloat(x),CGFloat(y))
	str.draw(at:pt, withAttributes: atts)
}

func drawFilledRect(_ rect:CGRect, _ color: CGColor) {
	let path = CGMutablePath()
	path.addRect(rect)
	context?.setFillColor(color)
	context?.addPath(path)
	context?.drawPath(using:.fill)
}

func drawFilledRect(_ x:Int, _ y:Int, _ xs:Int, _ ys:Int, _ fillColor: CGColor) {
	drawFilledRect(CGRect(x:CGFloat(x), y:CGFloat(y), width:CGFloat(xs), height:CGFloat(ys)), fillColor)
}

func drawRect(_ rect:CGRect, _ color: CGColor) {
    let path = CGMutablePath()
    path.addRect(rect)
    context?.setStrokeColor(color)
    context?.addPath(path)
    context?.drawPath(using:.stroke)
}

func drawLine(_ p1:Position, _ p2:Position, _ color:CGColor) {
	let path = CGMutablePath()
	path.move( to: p1.cgPoint())
	path.addLine(to: p2.cgPoint())
	
	context?.setLineWidth(1.0)
	context?.setStrokeColor(color)
	context?.addPath(path)
	context?.drawPath(using:.stroke)
}

func drawFilledCircle(_ center:Position, _ diameter:Int, _ color:CGColor) {
    let path = CGMutablePath()
    path.addEllipse(in: CGRect(x:CGFloat(center.x - diameter/2), y:CGFloat(center.y - diameter/2), width:CGFloat(diameter), height:CGFloat(diameter)))
    context?.setFillColor(color)
    context?.addPath(path)
    context?.drawPath(using:.fill)
}
