namespace scp.cloud;

using TeamClientService as service from './teamclientservice';
using {cuid} from '@sap/cds/common';

annotate cuid with {
    ID @(
        title : 'ID',
        UI.HiddenFilter,
        Core.Computed
    );
}

