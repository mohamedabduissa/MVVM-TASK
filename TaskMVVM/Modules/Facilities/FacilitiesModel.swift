
import Foundation

// MARK: - FacilityModel
struct FacilityModel: Codable {
    let data: [Datum]?
    let isSucceed: Bool?
    let messages: [String]?
    let messagesCode: Int?

    enum CodingKeys: String, CodingKey {
        case data = "Data"
        case isSucceed = "IsSucceed"
        case messages = "Messages"
        case messagesCode = "MessagesCode"
    }
    
    
    // MARK: - Datum
    struct Datum: Codable {
        let id: Int?
        let title, titleEN, titleAR, titleTrimmed: String?
        let titleTrimmedEN: String?
        let titleTrimmedAR: String?
        let parentDepartment: ParentDepartment?
        let parentServiceID, parentService, parentServiceEN, parentServiceAR: String?
        let brief, briefEN, briefAR, briefTrimmed: String?
        let briefTrimmedEN: String?
        let briefTrimmedAR: String?
        let datumDescription, descriptionEN, descriptionAR, prerequisites: String?
        let prerequisitesEN, prerequisitesAR, requiredDocuments, requiredDocumentsEN: String?
        let requiredDocumentsAR, fees, feesEN, feesAR: String?
        let timeFrame, timeFrameEN, timeFrameAR: String?
        let serviceChannels, serviceChannelsEN, serviceChannelsAR: String?
        let policiesAndProcedures, policiesAndProceduresEN, policiesAndProceduresAR, eServiceRequestURL: String?
        let eServiceRequestURLEN, eServiceRequestURLAR: String?
        let eServiceRequestFullURL: String?
        let videoID: String?
        let imageSrc, mobileImageSrc: String?
        let detailsURL: String?
        let hasSubServices: Bool?
        //let assistingDocumentURL, subServices: [String]?

        enum CodingKeys: String, CodingKey {
            case id = "ID"
            case title = "Title"
            case titleEN = "TitleEN"
            case titleAR = "TitleAR"
            case titleTrimmed = "TitleTrimmed"
            case titleTrimmedEN = "TitleTrimmedEN"
            case titleTrimmedAR = "TitleTrimmedAR"
            case parentDepartment = "ParentDepartment"
            case parentServiceID = "ParentServiceID"
            case parentService = "ParentService"
            case parentServiceEN = "ParentServiceEN"
            case parentServiceAR = "ParentServiceAR"
            case brief = "Brief"
            case briefEN = "BriefEN"
            case briefAR = "BriefAR"
            case briefTrimmed = "BriefTrimmed"
            case briefTrimmedEN = "BriefTrimmedEN"
            case briefTrimmedAR = "BriefTrimmedAR"
            case datumDescription = "Description"
            case descriptionEN = "DescriptionEN"
            case descriptionAR = "DescriptionAR"
            case prerequisites = "Prerequisites"
            case prerequisitesEN = "PrerequisitesEN"
            case prerequisitesAR = "PrerequisitesAR"
            case requiredDocuments = "RequiredDocuments"
            case requiredDocumentsEN = "RequiredDocumentsEN"
            case requiredDocumentsAR = "RequiredDocumentsAR"
            case fees = "Fees"
            case feesEN = "FeesEN"
            case feesAR = "FeesAR"
            case timeFrame = "TimeFrame"
            case timeFrameEN = "TimeFrameEN"
            case timeFrameAR = "TimeFrameAR"
            case serviceChannels = "ServiceChannels"
            case serviceChannelsEN = "ServiceChannelsEN"
            case serviceChannelsAR = "ServiceChannelsAR"
            case policiesAndProcedures = "PoliciesAndProcedures"
            case policiesAndProceduresEN = "PoliciesAndProceduresEN"
            case policiesAndProceduresAR = "PoliciesAndProceduresAR"
            case eServiceRequestURL = "EServiceRequestURL"
            case eServiceRequestURLEN = "EServiceRequestURLEN"
            case eServiceRequestURLAR = "EServiceRequestURLAR"
            case eServiceRequestFullURL = "EServiceRequestFullURL"
            case videoID = "VideoID"
            case imageSrc = "ImageSrc"
            case mobileImageSrc = "MobileImageSrc"
            case detailsURL = "DetailsURL"
            case hasSubServices
            //case assistingDocumentURL = "AssistingDocumentURL"
            //case subServices
        }
    }

    // MARK: - ParentDepartment
    struct ParentDepartment: Codable {
        let id: Int?
        let title, titleEN: String?
        let titleAR: String?
        let imageSrc: String?
        let brief, briefEN: String?
        let briefAR: String?
        let briefTrimmed, briefTrimmedEN: String?
        let briefTrimmedAR: String?

        enum CodingKeys: String, CodingKey {
            case id = "ID"
            case title = "Title"
            case titleEN = "TitleEN"
            case titleAR = "TitleAR"
            case imageSrc = "ImageSrc"
            case brief = "Brief"
            case briefEN = "BriefEN"
            case briefAR = "BriefAR"
            case briefTrimmed = "BriefTrimmed"
            case briefTrimmedEN = "BriefTrimmedEN"
            case briefTrimmedAR = "BriefTrimmedAR"
        }
    }
}
