import bb.cascades 1.0

Container {
    property variant imageSourceDefault
    property variant imageSourceSelected
    
    property int index: -1
    property bool selected: false
    property int pointerPosition
    
    leftMargin: 25
    rightMargin: 25
    
    scaleX: 0.72
    scaleY: 0.72
    
//    preferredWidth: leftMargin + rightMargin + 81 // image width
//    preferredHeight: preferredHeight
    
    ImageView {
        id: _iconImage
        imageSource: {
            if (selected) {
                imageSourceSelected
            } else {
                imageSourceDefault
            }
        }
    }
    
}
