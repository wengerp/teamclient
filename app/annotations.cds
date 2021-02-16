using TeamClientService as service from '../srv/teamclientservice';
using from '../srv/common';


annotate service.Teams with @(UI : {

    PresentationVariant                  : {
        SortOrder      : [{
            $Type    : 'Common.SortOrderType',
            Property : identifier
        }],
        Visualizations : ['@UI.LineItem']
    },
    LineItem                             : [
    {
        $Type : 'UI.DataField',
        Value : identifier
    },
    {
        $Type : 'UI.DataField',
        Value : name
    },
    ],

    SelectionFields                      : [name],

    //	Information for the header area of an entity representation
    HeaderInfo                           : {
        TypeName       : 'myTeam',
        TypeNamePlural : 'myTeams',
        TypeImageUrl   : 'sap-icon://alert',
        Title          : {Value : name}
    },

    //Facets for additional object header information (shown in the Object Page header)
    HeaderFacets                         : [{
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#HeaderGeneralInformation'
    }, ],
    FieldGroup #HeaderGeneralInformation : {Data : [
    {Value : identifier},
    ]},

    FieldGroup #GeneralInformation       : {Data : [
    {
        $Type : 'UI.DataField',
        Value : identifier
    },
    {
        $Type : 'UI.DataField',
        Value : name
    }
    ]},
    FieldGroup #Admin                    : {
        $Type : 'UI.FieldGroupType',
        Data  : [
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
        {
            $Type : 'UI.DataField',
            Value : createdBy,
        },
        ],
    },

    Facets                               : [
    {
        $Type  : 'UI.CollectionFacet',
        Label  : 'Team Overview',
        ID     : 'TeamOverviewFacet',
        Facets : [
            {
                $Type  : 'UI.ReferenceFacet',
                Label  : 'General Information',
                ID     : 'GeneralInformationFacet',
                Target : '@UI.FieldGroup#GeneralInformation'
            },
            {
                $Type  : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup#Admin',
                Label  : 'Admin Data',
                ID     : 'AdminDataFacet',
            },
        //end of reference facet enhancement
        ]
    },
    //this facet shows a table on the Object Page by referring to a lineItem annotation via association incidentFlow
    //the referred LineItem annotation definition for entity IncidentFlow is defined below
    {
        $Type  : 'UI.ReferenceFacet',
        Label  : 'Antworten',
        ID     : 'AnswersFacet',
        Target : 'answer/@UI.LineItem',
    //![@UI.Hidden] : isDraft
    }
    ]
});

annotate service.Answers with @(UI : {LineItem : [

//begin of column enhancement
{
    $Type : 'UI.DataField',
    Value : answer
},
//end of column enhancement
{
    $Type : 'UI.DataField',
    Value : team_ID
}
]});
