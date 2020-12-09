//
//  WorkerController.swift
//  ppvis-2
//
//  Created by Алина Ненашева on 2.12.20.
//

import Foundation


class WorkerController {
    let amusementPark: AmusementPark
    let authorizationWindow: AuthorizationWindow
    let verifyer: Verifyer
    
    init(amusementPark: AmusementPark, authorizationWindow: AuthorizationWindow, verifyer: Verifyer) {
        self.amusementPark = amusementPark
        self.authorizationWindow = authorizationWindow
        self.verifyer = verifyer
        execute()
    }
    
    func deleteWorker() {
        let deleteInfo = authorizationWindow.mainMenuWindow.workerWindow.createFireDialog()
        let reason = deleteInfo.0
        let workerName = deleteInfo.1
        let loginInfo = authorizationWindow.mainMenuWindow.workerWindow.createVerifyDialog()
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
    
    func giveVocationDays(number: Int, workerName: String){
        for worker in amusementPark.attractionWorkers {
            if worker.fullName == workerName {
                worker.vocationDays += number
            }
        }
    }
    
    func addRewardToPayCheck(sum: Double, workerName: String) {
        for worker in amusementPark.attractionWorkers {
            if worker.fullName == workerName {
                worker.payCheck.payCheckRecords.append(PayCheckRecord(money: sum, typeOfRecord: "rewarded"))
            }
        }
    }
    
    func fineWorker() {
        let fineInfo = authorizationWindow.mainMenuWindow.workerWindow.createFineDialog()
        let type = fineInfo.0
        let workerName = fineInfo.1
        for worker in amusementPark.attractionWorkers {
            if worker.fullName == workerName {
                if type == 1{
                    let workOffDays = Int(authorizationWindow.mainMenuWindow.workerWindow.createPayCheckManipulationTypeDialog(message: "workOff days"))
                    giveWorkOffDays(number: workOffDays, workerName: worker.fullName)
                } else if type == 2 {
                    let sumOfFine = authorizationWindow.mainMenuWindow.workerWindow.createPayCheckManipulationTypeDialog(message: "sum of fine")
                    addFineToPayCheck(sum: sumOfFine, workerName: worker.fullName)
                }
            }
        }
    }
    
    func giveWorkOffDays(number: Int, workerName: String) {
        for worker in amusementPark.attractionWorkers {
            if worker.fullName == workerName {
                worker.workingOffDays += number
            }
        }
    }
    
    func addFineToPayCheck(sum: Double, workerName: String) {
        for worker in amusementPark.attractionWorkers {
            if worker.fullName == workerName {
                worker.payCheck.payCheckRecords.append(PayCheckRecord(money: -sum, typeOfRecord: "fined"))
            }
        }
    }
    
    func rewardWorker() {
        let rewardInfo = authorizationWindow.mainMenuWindow.workerWindow.createRewardDialog()
        let type = rewardInfo.0
        let workerName = rewardInfo.1
        for worker in amusementPark.attractionWorkers {
            if worker.fullName == workerName {
                if type == 1{
                    let vocation = Int(authorizationWindow.mainMenuWindow.workerWindow.createPayCheckManipulationTypeDialog(message: "vocation days"))
                    giveVocationDays(number: vocation, workerName: worker.fullName)
                } else if type == 2 {
                    let sumOfReward = authorizationWindow.mainMenuWindow.workerWindow.createPayCheckManipulationTypeDialog(message: "sum of reward")
                    addRewardToPayCheck(sum: sumOfReward, workerName: worker.fullName)
                }
            }
        }
    }
    
    func sendOnVocation() {
        let workerName = authorizationWindow.mainMenuWindow.workerWindow.createLetDialog()
        for worker in amusementPark.attractionWorkers {
            if worker.fullName == workerName {
                worker.onVocation = true
            }
        }
    }
    
    func changeWorkingHours() {
        let changeHoursInfo = authorizationWindow.mainMenuWindow.workerWindow.createChangeHoursDialog()
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
        let changePlaceInfo = authorizationWindow.mainMenuWindow.workerWindow.createChangePlaceDialog()
        let newPlace = changePlaceInfo.0
        let workerName = changePlaceInfo.1
        for worker in amusementPark.attractionWorkers {
            if worker.fullName == workerName {
                worker.maintainedAttraction = newPlace
            }
        }
    }

    @objc func addWorker() {
        let fullName = authorizationWindow.mainMenuWindow.addRecordWindow.getWorkerName()
        let post = authorizationWindow.mainMenuWindow.addRecordWindow.getWorkerPost()
        let dateOfSigning = authorizationWindow.mainMenuWindow.addRecordWindow.getStartContractTerm()
        let dateOfExpiring = authorizationWindow.mainMenuWindow.addRecordWindow.getEndContractTerm()
        let dateOfStart = authorizationWindow.mainMenuWindow.addRecordWindow.getStartWorkingHours()
        let dateOfEnd = authorizationWindow.mainMenuWindow.addRecordWindow.getEndWorkingHours()
        let attractionId = authorizationWindow.mainMenuWindow.addRecordWindow.getMaintainedAttraction()
        let worker = AttractionWorker(maintainedAttraction: attractionId, fullName: fullName, post: post, workingOffDays: 0, vocationDays: 0, contract: Contract(dateOfSigning: dateOfSigning, dateOfExpiring: dateOfExpiring), payCheck: PayCheck(), workingHours: WorkingHours(dateOfStart: dateOfStart, dateOfEnd: dateOfEnd))
        amusementPark.attractionWorkers.append(worker)
    }
    
     func execute() {
        authorizationWindow.mainMenuWindow.workerWindow.setChangeHoursButtonHandler(changeWorkingHours)
        authorizationWindow.mainMenuWindow.workerWindow.setLetButtonHandler(sendOnVocation)
        authorizationWindow.mainMenuWindow.workerWindow.setChangePlaceButtonHandler(changeWorkingPlace)
        authorizationWindow.mainMenuWindow.workerWindow.setFineButtonHandler(rewardWorker)
        authorizationWindow.mainMenuWindow.workerWindow.setFineButtonHandler(fineWorker)
        authorizationWindow.mainMenuWindow.workerWindow.setDeleteButtonHandler(deleteWorker)
        authorizationWindow.mainMenuWindow.addRecordWindow.setAddWorkerButtonHandler(addWorker)
    }
}
