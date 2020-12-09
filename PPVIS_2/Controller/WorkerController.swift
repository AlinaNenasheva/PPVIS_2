//
//  WorkerController.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 2.12.20.
//

import Foundation


class WorkerController {
    let amusementPark: AmusementPark
    let mainMenuWindow: MainMenuWindow
    let verifyer: Verifyer
    
    init(amusementPark: AmusementPark, mainMenuWindow: MainMenuWindow, verifyer: Verifyer) {
        self.amusementPark = amusementPark
        self.mainMenuWindow = mainMenuWindow
        self.verifyer = verifyer
        execute()
    }
    
    func deleteWorker() {
        let deleteInfo = mainMenuWindow.workerWindow.createFireDialog()
        let reason = deleteInfo.0
        let workerName = deleteInfo.1
        let loginInfo = mainMenuWindow.workerWindow.createVerifyDialog()
        let login = loginInfo.0
        let password = loginInfo.1
        if verifyer.verifyPassword(login: login, password: password) {
        for worker in amusementPark.attractionWorkers {
            if worker.fullName == workerName {
                if reason == 1 {
                    Application(reason: "worker will", workerName: workerName)
                } else if reason == 2 {
                    Application(reason: "violation", workerName: workerName)
                }
            }
        }
        amusementPark.attractionWorkers = amusementPark.attractionWorkers.filter { $0.fullName != workerName }
        }
    }
    
    func giveVocationDays(number: Int, worker: Worker)->Worker{
        worker.vocationDays += number
        return worker
    }
    
    func addRewardToPayCheck(sum: Double, worker: Worker)->Worker {
        worker.payCheck.payCheckRecords.append(PayCheckRecord(money: sum, typeOfRecord: "rewarded"))
        return worker
    }
    
    func fineWorker() {
        let fineInfo = mainMenuWindow.workerWindow.createFineDialog()
        let type = fineInfo.0
        let workerName = fineInfo.1
        for worker in amusementPark.attractionWorkers {
            if worker.fullName == workerName {
                if type == 1{
                    let workOffDays = Int(mainMenuWindow.workerWindow.createPayCheckManipulationTypeDialog(message: "workOff days"))
                giveWorkOffDays(number: workOffDays, worker: worker)
                } else if type == 2 {
                    let sumOfFine = mainMenuWindow.workerWindow.createPayCheckManipulationTypeDialog(message: "sum of fine")
                    addFineToPayCheck(sum: sumOfFine, worker: worker)
                }
            }
        }
    }
    
    func giveWorkOffDays(number: Int, worker: Worker) {
        worker.workingOffDays += number
    }
    
    func addFineToPayCheck(sum: Double, worker: Worker) {
        worker.payCheck.payCheckRecords.append(PayCheckRecord(money: -sum, typeOfRecord: "fined"))
    }
    
    func rewardWorker() {
        let rewardInfo = mainMenuWindow.workerWindow.createRewardDialog()
        let type = rewardInfo.0
        let workerName = rewardInfo.1
        for worker in amusementPark.attractionWorkers {
            if worker.fullName == workerName {
                if type == 1{
                    let vocation = Int(mainMenuWindow.workerWindow.createPayCheckManipulationTypeDialog(message: "vocation days"))
                giveVocationDays(number: vocation, worker: worker)
                } else if type == 2 {
                    let sumOfReward = mainMenuWindow.workerWindow.createPayCheckManipulationTypeDialog(message: "sum of reward")
                    addRewardToPayCheck(sum: sumOfReward, worker: worker)
                }
            }
        }
    }
    
    func sendOnVocation() {
        let workerName = mainMenuWindow.workerWindow.createLetDialog()
        for worker in amusementPark.attractionWorkers {
            if worker.fullName == workerName {
                worker.onVocation = true
            }
        }
    }
    
    func changeWorkingHours() {
        let changeHoursInfo = mainMenuWindow.workerWindow.createChangeHoursDialog()
        let start = changeHoursInfo.0
        let end = changeHoursInfo.1
        let workerName = changeHoursInfo.2
        for worker in amusementPark.attractionWorkers {
            if worker.fullName == workerName {
                let workingHours = WorkingHours(dateOfStart: start, dateOfEnd: end)
                worker.workingHours = workingHours
            }
        }
    }
    
    func changeWorkingPlace() {
        let changePlaceInfo = mainMenuWindow.workerWindow.createChangePlaceDialog()
        let newPlace = changePlaceInfo.0
        let workerName = changePlaceInfo.1
        for worker in amusementPark.attractionWorkers {
            if worker.fullName == workerName {
                worker.maintainedAttraction = newPlace
            }
        }
    }

    @objc func addWorker() {
        let fullName = mainMenuWindow.addRecordWindow.getWorkerName()
        let post = mainMenuWindow.addRecordWindow.getWorkerPost()
        let dateOfSigning = mainMenuWindow.addRecordWindow.getStartContractTerm()
        let dateOfExpiring = mainMenuWindow.addRecordWindow.getEndContractTerm()
        let dateOfStart = mainMenuWindow.addRecordWindow.getStartWorkingHours()
        let dateOfEnd = mainMenuWindow.addRecordWindow.getEndWorkingHours()
        let attractionId = mainMenuWindow.addRecordWindow.getMaintainedAttraction()
        let worker = AttractionWorker(maintainedAttraction: attractionId, fullName: fullName, post: post, workingOffDays: 0, vocationDays: 0, contract: Contract(dateOfSigning: dateOfSigning, dateOfExpiring: dateOfExpiring), payCheck: PayCheck(), workingHours: WorkingHours(dateOfStart: dateOfStart, dateOfEnd: dateOfEnd))
        amusementPark.attractionWorkers.append(worker)
    }
    
     func execute() {
//        mainMenuWindow.attractionWindow.getCloseButton().addTarget(self, action: #selector(determinateReason), for: .touchUpInside)
//        mainMenuWindow.attractionWindow.getOpenButton().addTarget(self, action: #selector(openAttraction), for: .touchUpInside)
//        mainMenuWindow.attractionWindow.getAnalyzePopularityButton().addTarget(self, action: #selector(analyzePopularity), for: .touchUpInside)
//        mainMenuWindow.attractionWindow.getStatisticButton().addTarget(self, action: #selector(getStatistic), for: .touchUpInside)
//        mainMenuWindow.attractionWindow.getChangePriceButton().addTarget(self, action: #selector(changePrice), for: .touchUpInside)
//        mainMenuWindow.attractionWindow.getAddTicketsButton().addTarget(self, action: #selector(updateSoldTicketsAndPassibility), for: .touchUpInside)
//        mainMenuWindow.addRecordWindow.getAddWorkerButton().addTarget(self, action: #selector(addWorker), for: .touchUpInside)
        mainMenuWindow.workerWindow.setChangeHoursButtonHandler(changeWorkingHours)
        mainMenuWindow.workerWindow.setLetButtonHandler(sendOnVocation)
        mainMenuWindow.workerWindow.setChangePlaceButtonHandler(changeWorkingPlace)
        mainMenuWindow.workerWindow.setFineButtonHandler(rewardWorker)
        mainMenuWindow.workerWindow.setFineButtonHandler(fineWorker)
        mainMenuWindow.workerWindow.setDeleteButtonHandler(deleteWorker)
        mainMenuWindow.addRecordWindow.setAddWorkerButtonHandler(addWorker)
    }
}
