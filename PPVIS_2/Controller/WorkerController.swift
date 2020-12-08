//
//  WorkerController.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 2.12.20.
//

import Foundation


class WorkerController: Controller {
    let amusementPark: AmusementPark
    let mainMenu: MainMenu
    
    init(amusementPark: AmusementPark, mainMenu: MainMenu) {
        self.amusementPark = amusementPark
        self.mainMenu = mainMenu
        execute()
    }
    
    func deleteWorker(workerFullName: String, workers: [Worker])->[Worker] {
        var resultWorkers = workers
        resultWorkers = workers.filter { $0.fullName != workerFullName }
        return resultWorkers
    }
    
    func giveVocationDays(number: Int, worker: Worker)->Worker{
        worker.vocationDays += number
        return worker
    }
    
    func addRewardToPayCheck(sum: Double, worker: Worker)->Worker {
        worker.payCheck.payCheckRecords.append(PayCheckRecord(money: sum, typeOfRecord: "rewarded"))
        return worker
    }
    
    func giveWorkOffDays(number: Int, worker: Worker)->Worker{
        worker.workingOffDays += number
        return worker
    }
    
    func addFineToPayCheck(sum: Double, worker: Worker)->Worker {
        worker.payCheck.payCheckRecords.append(PayCheckRecord(money: -sum, typeOfRecord: "fined"))
        return worker
    }
    
    func sendOnVocation(worker: Worker)->Worker {
        worker.onVocation = true
        return worker
    }
    
    func changeWorkingHours(workingHours: WorkingHours, worker: Worker)-> Worker {
        worker.workingHours = workingHours
        return worker
    }
    
//    func changeWorkingPlace(attraction: Attraction, worker: AttractionWorker)-> AttractionWorker {
//        worker.maintainedAttraction = attraction
//        return worker
//    }

    @objc func addWorker() {
        let fullName = mainMenu.addRecordWindow.getWorkerName()
        let post = mainMenu.addRecordWindow.getWorkerPost()
        let dateOfSigning = mainMenu.addRecordWindow.getStartContractTerm()
        let dateOfExpiring = mainMenu.addRecordWindow.getEndContractTerm()
        let dateOfStart = mainMenu.addRecordWindow.getStartWorkingHours()
        let dateOfEnd = mainMenu.addRecordWindow.getEndWorkingHours()
        let attractionId = mainMenu.addRecordWindow.getMaintainedAttraction()
        let worker = AttractionWorker(maintainedAttraction: attractionId, fullName: fullName, post: post, workingOffDays: 0, vocationDays: 0, contract: Contract(dateOfSigning: dateOfSigning, dateOfExpiring: dateOfExpiring), payCheck: PayCheck(), workingHours: WorkingHours(dateOfStart: dateOfStart, dateOfEnd: dateOfEnd))
        amusementPark.attractionWorkers.append(worker)
    }
    
     func execute() {
//        mainMenu.attractionWindow.getCloseButton().addTarget(self, action: #selector(determinateReason), for: .touchUpInside)
//        mainMenu.attractionWindow.getOpenButton().addTarget(self, action: #selector(openAttraction), for: .touchUpInside)
//        mainMenu.attractionWindow.getAnalyzePopularityButton().addTarget(self, action: #selector(analyzePopularity), for: .touchUpInside)
//        mainMenu.attractionWindow.getStatisticButton().addTarget(self, action: #selector(getStatistic), for: .touchUpInside)
//        mainMenu.attractionWindow.getChangePriceButton().addTarget(self, action: #selector(changePrice), for: .touchUpInside)
//        mainMenu.attractionWindow.getAddTicketsButton().addTarget(self, action: #selector(updateSoldTicketsAndPassibility), for: .touchUpInside)
        mainMenu.addRecordWindow.getAddWorkerButton().addTarget(self, action: #selector(addWorker), for: .touchUpInside)
    }
}
