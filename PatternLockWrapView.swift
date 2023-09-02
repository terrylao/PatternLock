//
//  PatternLockWrapView.swift
//  BSD license

import SwiftUI

struct PatternLockWrapView: UIViewControllerRepresentable {
    @Environment(\.presentationMode) private var presentationMode
    let identifier: Binding<String>
    final class Coordinator: NSObject, ViewControllerDelegate {
        func eventOccured(_ viewController: ViewController, identifier: String) {
            identifierBinding.wrappedValue = identifier
        }
        
        var parent: PatternLockWrapView
        let identifierBinding: Binding<String>
        init(_ parent: PatternLockWrapView,identifierBinding: Binding<String>) {
            self.parent = parent
            self.identifierBinding = identifierBinding
        }
        func didPressChangeText(_ storyboardVC: ViewController) {
            storyboardVC.llabel.text = "ABCD"
        }
        func didPressGoBack(_ storyboardVC: ViewController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self,identifierBinding: identifier)
    }
    func makeUIViewController(context: UIViewControllerRepresentableContext<PatternLockWrapView>) -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let storyboardVC = storyboard.instantiateInitialViewController() as! ViewController
        storyboardVC.delegate = context.coordinator
        return storyboardVC
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        uiViewController.configuareLockViewWithImages()
    }
    
    
    typealias UIViewControllerType = ViewController
    
}

struct PatternLockWrapView_Previews: PreviewProvider {
    @State static var clasificationIdentifier: String = ""
    static var previews: some View {
        PatternLockWrapView(identifier: $clasificationIdentifier)
    }
}
