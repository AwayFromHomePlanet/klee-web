directives.directive('nanobar', [
    '$log',
    '$rootScope',
    function($log, $rootScope) {
        return {
            restrict: 'A',
            link: function postLink(scope, element, attrs) {
                if (!Nanobar) {
                    $log.error('Nanobar unavailable');
                    return;
                }

                var options = {
                    target: element.get(0),
                    bg: "#5cb4ff"
                };
                var nanobar = new Nanobar(options);
                var percentage;
                var timeout = 25;
                var stepIntervalID;

                $rootScope.startNanobar = function () {
                    if (!nanobar || typeof(nanobar.go) !== 'function') {
                        return;
                    }

                    percentage = 20;
                    var increaseNanobar = function () {
                        nanobar.go(percentage);
                        percentage += (100 - percentage) / 160;
                        stepIntervalID = setTimeout(increaseNanobar, timeout);
                    };
                    stepIntervalID = setTimeout(increaseNanobar, timeout);
                };

                $rootScope.finishNanobar = function () {
                    clearTimeout(stepIntervalID);
                    nanobar.go(100);
                };
            }
        };
    }
]);