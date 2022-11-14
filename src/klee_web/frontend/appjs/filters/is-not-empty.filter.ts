import {filters} from './filters.module';

filters.filter('isNotEmpty', [
    function() {
        var bar;
        return function(obj) {
            for (bar in obj) {
                if (obj.hasOwnProperty(bar)) {
                    return true;
                }
            }
            return false;
        };
    }
]);
