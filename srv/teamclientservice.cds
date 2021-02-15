using sap.cloud from '../db/schema';

service TeamClientService {

    @odata.draft.enabled
    entity Answers as projection on cloud.Answers;

    @readonly
    entity Teams    as projection on cloud.Teams;

}
