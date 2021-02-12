using my.teamclient as my from '../db/data-model';


service CatalogService {

    entity Teams @readonly    as projection on my.Teams;
    entity Problems @readonly as projection on my.Problems;
    entity Teams_problems @readonly as projection on my.Teams_problems;
    //entity Problems_for_Teams @readonly as projection on my.Problems_for_Teams;

}
