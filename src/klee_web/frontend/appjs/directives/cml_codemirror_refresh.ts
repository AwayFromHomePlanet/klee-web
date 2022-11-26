var directives = angular.module('directives', []);

// Monkey patch
directives.directive('cmlCodemirrorRefresh', [
    '$timeout',
    function ($timeout) {
        return {
            restrict: 'C',
            link: function (scope, element, attrs) {
                attrs.$observe('uiRefresh', function(value) {
                    scope.$watch(value, function (newValue) {
                        $timeout(function () {
                            element.children()[0].CodeMirror.refresh();
                        }, 100);
                    });
                });
            }
        };
    }
]);

