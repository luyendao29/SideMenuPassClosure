//
//  SideViewController.swift
//  SideMenuClosure
//
//  Created by Boss on 5/14/19.
//  Copyright © 2019 Boss. All rights reserved.
//

import UIKit

class SideViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var textFiledName: UITextField!
    
    @IBOutlet weak var textFieldAge: UITextField!
    var myClosure: ((_ data: Person?) -> Void)?
    var dongmenu: Slide?
    override func viewDidLoad() {
        super.viewDidLoad()
       setupAvatarImage()

        // Do any additional setup after loading the view.
    }
    // bo tron anh xong goi len viewdidload cho chay
    private func setupAvatarImage() {
        photo.layer.cornerRadius = photo.bounds.height / 2
    }

    @IBAction func ClickPassData(_ sender: Any) {
        myClosure?(Person(image: photo.image!, name: textFiledName.text!, age: textFieldAge.text!))
        //truyen du lieu sang dong luon
        dongmenu?.showing = false
        
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        photo.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    // Check các giá trị nhập vào menu cho theo yêu cầu như text phải có, image phải có....
    private func validationDateInput() -> Bool {
        guard let name = textFiledName.text, let age = textFieldAge.text else {
            return false
        }
        
        if name.isEmpty || age.isEmpty {
            print("Mời nhập đầy đủ thông tin")
            return false
        }
        
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
