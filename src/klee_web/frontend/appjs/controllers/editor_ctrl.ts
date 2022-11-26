var controllers = angular.module('controllers', []);

controllers.controller('EditorCtrl', [
    '$scope',
    function($scope) {
        $scope.editorOptions = {
            viewportMargin: 5,
            lineWrapping: true,
            lineNumbers: true,
            mode: {
                name: 'text/x-csrc',
                useCPP: true
            },
            theme: 'neo'
        };
    }
]);

