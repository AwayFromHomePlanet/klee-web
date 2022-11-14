import {filters} from './filters.module';

filters.filter('truncate', [
    function() {
        return function(input, limit) {
            if (input.length <= limit) {
                return input;
            }
            return input.slice(0, limit) + "...";
        };
    }
]);