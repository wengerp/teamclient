using sap.cloud from '../db/schema';

service TeamClientService {

    @odata.draft.enabled
    @(Capabilities.InsertRestrictions.Insertable : true)
    @(Capabilities.UpdateRestrictions.Updatable : true)
    @(Capabilities.DeleteRestrictions.Deletable : false)
    entity Answers as projection on cloud.Answers;

    @odata.draft.enabled
    @(Capabilities.InsertRestrictions.Insertable : true)
    @(Capabilities.UpdateRestrictions.Updatable : true)
    @(Capabilities.DeleteRestrictions.Deletable : true)
    entity Teams   as projection on cloud.Teams;

}
