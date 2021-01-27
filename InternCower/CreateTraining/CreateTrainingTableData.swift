//
//  CreateTrainingTableData.swift
//  InternCower
//
//  Created by Apple on 1/27/21.
//  Copyright © 2021 ThucTapSinh. All rights reserved.
//

import UIKit

protocol CreateTrainingSectionDelegate: AnyObject {
    func touchInput(type: CreateTrainingInputType)
}
enum CreateTrainingSectionEnum : Int {
    case header = 0
    case info = 1
    case attachment = 2
}
enum CreateTrainingInputType {
    case title
    case startDate
    case endDate
    case city
    case distric
    case inputxxxx
    // ... tung cai  input kia
}

class CreateTrainingInputViewModel : NSObject {
    var type : CreateTrainingInputType
    var name : String
    var value : Any?

    init(_ type: CreateTrainingInputType, name: String = "", value: Any? = nil){
        self.type   = type
        self.name = name
        self.value = value
    }

}

class CreateTrainingTableData: NSObject {
    let numOfSection = 3
    var models: [CreateTrainingInputViewModel] = [CreateTrainingInputViewModel]()
    var tableView: UITableView!
    weak var delegate:CreateTrainingSectionDelegate?
    init(_ tb: UITableView) {
        super.init()
        self.tableView = tb
        createDefault()
    }
    func createDefault() {
        models.removeAll()
        models.append(CreateTrainingInputViewModel(.title, name:"Title"))
        models.append(CreateTrainingInputViewModel(.startDate, name:"Start Date"))
        models.append(CreateTrainingInputViewModel(.endDate, name:"End Date"))
        models.append(CreateTrainingInputViewModel(.city, name:"City"))
    }

    func reload() {
   
//        UIView.setAnimationsEnabled(true)
//        self.tableView.beginUpdates()
        self.tableView.reloadSections([CreateTrainingSectionEnum.info.rawValue], with: .fade)
//        self.tableView.endUpdates()
      
    }
}
extension CreateTrainingTableData: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // tam thoi la 3
        return numOfSection
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        switch section {
        case CreateTrainingSectionEnum.header.rawValue:
            return 1
        case CreateTrainingSectionEnum.info.rawValue:
            // test
            return models.count
        case CreateTrainingSectionEnum.attachment.rawValue:
            return 1

        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
        case CreateTrainingSectionEnum.header.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CreateTrainingHeaderCell", for: indexPath)
            return cell
        case CreateTrainingSectionEnum.info.rawValue:
            var model = self.models[indexPath.row]
         /// cho nay dang le se swith case theo model.type de hien thi cac cell khac nhau [datetime, title, chon dia chi , demo  nen chi lam 1 cell cho nhanh =))]
            let cell = tableView.dequeueReusableCell(withIdentifier: "CreateTrainingInputCell", for: indexPath) as? CreateTrainingInputCell
            cell?.setupData(model: model)
            return cell ?? UITableViewCell()
        case CreateTrainingSectionEnum.attachment.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CreateTrainingAttachmentCell", for: indexPath)
            return cell
        default:
            return UITableViewCell()
        }
    }
    // vi du tu dong them cell
    // sau nay  sua thanh thay vi click o city
    // thi  dua vao su kien khi hoan thanh chon o city thi chay lenh duoi
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section != CreateTrainingSectionEnum.info.rawValue {
            return
        }
        // chay cai nay de tao them o distric
        let model = self.models[indexPath.row]
        switch model.type {
        case .city:
            if !checkHasType( .distric ) {
                models.append(CreateTrainingInputViewModel(.distric, name:"Distric"))}
            self.reload()
            case .distric:
            if !checkHasType( .inputxxxx ) {
                models.append(CreateTrainingInputViewModel(.inputxxxx, name:"inputxxxx"))}
            self.reload()
            default:
            return
        }
        delegate?.touchInput(type: model.type)
    }
    func checkHasType (_ type : CreateTrainingInputType ) -> Bool {
        return   models.first(where: { (model) -> Bool in
                       return model.type == type
                }) != nil
    }
}
