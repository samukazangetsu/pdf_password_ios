import Flutter
import UIKit
import PDFKit

public class PdfPasswordIosPlugin: NSObject, FlutterPlugin {
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "pdf_password_ios", binaryMessenger: registrar.messenger())
        
        let instance = PdfPasswordIosPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func verifyPassword(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        var isEncrypted = false
           guard let flutterData = call.arguments as? FlutterStandardTypedData else {
               result(isEncrypted)
               return
           }
           if let pdfDocument = PDFDocument(data: flutterData.data) {
               isEncrypted = pdfDocument.isEncrypted
           }
           result(isEncrypted);
       
  }
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        verifyPassword(call, result: result)
    }
}
