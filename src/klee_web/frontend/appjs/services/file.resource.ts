services.factory('File', [
    '$resource',
    function($resource) {
        return $resource('/api/projects/:projectId/files/:fileId', {
            projectId: '@projectId',
            fileId: '@id'
        }, {
            'update': {
                method: 'PUT'
            }
        });
    }
]);
