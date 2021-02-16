namespace sap.cloud;

using {
    managed,
    cuid,
    sap.common
} from '@sap/cds/common';

type Identifier : String(100)@(title : 'Identifier');

@cds.autoexpose
abstract entity identified : cuid {
    identifier : Identifier not null;
}

annotate identified with @(
    Common.SemanticKey : [identifier],
    UI.Identification  : [{Value : identifier}]
) {
    ID @Common : {
        Text            : identifier,
        TextArrangement : #TextOnly

    };
}

entity Answers : managed, identified {
    answer : String @title : 'Antwort';
    team   : Association to Teams;
}

entity Teams : managed, identified {
    //key id     : UUID;
    answer : Association to many Answers
                 on answer.team = $self;
    name   : String;
}


/*
entity TeamClientCodeList : common.CodeList {
    key code : String(20);
}

entity Category : TeamClientCodeList {}
*/
