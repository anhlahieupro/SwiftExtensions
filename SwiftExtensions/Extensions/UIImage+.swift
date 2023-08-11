import UIKit

extension UIImage {
    var squared: UIImage? {
        let originalWidth  = size.width
        let originalHeight = size.height
        var x: CGFloat = 0.0
        var y: CGFloat = 0.0
        var edge: CGFloat = 0.0
        
        if (originalWidth > originalHeight) {
            // landscape
            edge = originalHeight
            x = (originalWidth - edge) / 2.0
            y = 0.0
            
        } else if (originalHeight > originalWidth) {
            
            // portrait
            edge = originalWidth
            x = 0.0
            y = (originalHeight - originalWidth) / 2.0
        } else {
            
            // square
            edge = originalWidth
        }
        
        let cropSquare = CGRect(x: x, y: y, width: edge, height: edge)
        guard let imageRef = cgImage?.cropping(to: cropSquare) else { return nil }
        
        return UIImage(cgImage: imageRef, scale: scale, orientation: imageOrientation)
    }
}

extension UIImage {
    func resized(maxSize: CGFloat) -> UIImage? {
        let scale: CGFloat
        if size.width > size.height {
            scale = maxSize / size.width
        } else {
            scale = maxSize / size.height
        }
        
        let newWidth = size.width * scale
        let newHeight = size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}

extension UIImage {
    func toData(isOpaque: Bool = true, compressionQuality: CGFloat = 1) -> Data? {
        return flattened(isOpaque: isOpaque)?.jpegData(compressionQuality: compressionQuality)
    }
    
    func flattened(isOpaque: Bool = true) -> UIImage? {
        if imageOrientation == .up { return self }
        UIGraphicsBeginImageContextWithOptions(size, isOpaque, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
