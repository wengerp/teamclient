using  TeamClientService as service from '../srv/teamclientservice';
using from '../srv/common';


annotate service.Teams with @(UI : {

    PresentationVariant                  : {
        SortOrder      : [{
            $Type    : 'Common.SortOrderType',
            Property : id
        }],
        Visualizations : ['@UI.LineItem']
    },
    LineItem                             : [
    {
        $Type : 'UI.DataField',
        Value : id
    },
    {
        $Type : 'UI.DataField',
        Value : name
    }
    ],

    SelectionFields                      : [
    name
    ],

    //	Information for the header area of an entity representation
    HeaderInfo                           : {
        TypeName       : 'Team',
        TypeNamePlural : 'Teams',
        TypeImageUrl   : 'sap-icon://alert',
        Title          : {Value : id}
    },

    //Facets for additional object header information (shown in the Object Page header)
    HeaderFacets                         : [{
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#HeaderGeneralInformation'
    }, ],
    FieldGroup #HeaderGeneralInformation : {Data : [
    {Value : id},
    {Value : name}
    ]}
    },

    FieldGroup #GeneralInformation       : {Data : [
    {
        $Type : 'UI.DataField',
        Value : ID
    },
    {
        $Type : 'UI.DataField',
        Value : name
    }
    ]},

    Facets                               : [{
        $Type  : 'UI.CollectionFacet',
        Label  : 'Team',
        ID     : 'TeamsFacet',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Teams',
            ID     : 'TeamsFacet',
            Target : '@UI.FieldGroup#GeneralInformation'
        }

        ]
    },
        {
        $Type         : 'UI.ReferenceFacet',
        Label         : 'Problmes',
        ID            : 'Problems',
        Target        : 'problems/@UI.LineItem',
        ![@UI.Hidden] : isDraft
    }


    ]
);

annotate service.Teams_problems with @(UI : {LineItem : [

{
    $Type : 'UI.DataField',
    Value : up__ID
},
{
    $Type : 'UI.DataField',
    Value : problem_ID
}
]});

/*

//this facet shows a table on the Object Page by referring to a lineItem annotation via association incidentFlow
//the referred LineItem annotation definition for entity IncidentFlow is defined below
{
    $Type         : 'UI.ReferenceFacet',
    Label         : '{i18n>IncidentProcessFlow}',
    ID            : 'ProcessFlowFacet',
    Target        : 'incidentFlow/@UI.LineItem',
    ![@UI.Hidden] : isDraft
}

annotate service.IncidentFlow with @(UI : {LineItem : [


{
$Type : 'UI.DataField',
Value : processStep
},
{
$Type : 'UI.DataField',
Value : stepStartDate
},
{
$Type : 'UI.DataField',
Value : stepEndDate
}
]});
*/
