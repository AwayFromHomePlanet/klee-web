var controllers = angular.module('controllers', []);

controllers.controller('FailedTestcasesPaginationCtrl', [
    '$scope',
    function($scope){
        // Pagination settings
        $scope.currentPage = 1;
        $scope.maxSize = 5;

        $scope.$watch('currentPage', function() {
        })
    }
]);
