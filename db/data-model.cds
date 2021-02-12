namespace my.teamclient;

using {managed} from '@sap/cds/common';

entity Teams {
    key ID       : Integer;
        problems : Composition of many {
                       key problem : Association to Problems
                   }
        name     : String;
}

entity Problems {
    key ID       : Integer;
        question : String;
        answer   : String;
}
