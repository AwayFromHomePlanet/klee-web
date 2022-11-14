import {services} from './services.module';

services.factory('Project', [
    '$resource',
    function($resource) {
        return $resource('/api/projects/:id', {
            id: '@id'
        }, {
            'update': {
                method: 'PUT'
            }
        });
    }
]);