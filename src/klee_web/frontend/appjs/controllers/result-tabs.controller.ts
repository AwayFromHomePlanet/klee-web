import * as angular from 'angular';
import {controllers} from './controllers.module';

controllers.controller('ResultTabsCtrl', [
    '$scope',
    function($scope) {
        $scope.tabs = {
            output: {
                active: true
            },
            stats: {
                active: false
            },
            coverage: {
                active: false
            },
            testcases: {
                active: false
            }
        };

        $scope.hideAllTabs = function() {
            angular.forEach($scope.tabs, function(tab, name) {
                $scope.tabs[name].active = false;
            });
        };

        $scope.setTab = function(tab) {
            if (tab in $scope.tabs) {
                $scope.hideAllTabs();
                $scope.tabs[tab].active = true;
            }
        };

        // Switch tab back to output if we hit submit
        $scope.$watch('submitted', function(submitted) {
            if (submitted) {
                $scope.setTab('output');
            }
        });

    }
]);