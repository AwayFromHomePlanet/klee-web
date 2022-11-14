import {controllers} from './controllers.module';

controllers.controller('TestcasesPaginationCtrl', [
    '$scope',
    function($scope){
        // Pagination settings
        $scope.currentPage = 1;
        $scope.maxSize = 5;

        $scope.$watch('currentPage', function() {
        })
    }
]);