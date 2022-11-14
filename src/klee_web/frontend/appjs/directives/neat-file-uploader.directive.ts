import {directives} from './directives.module';

directives.directive('neatFileUploader', [
    function () {
        return {
            restrict: 'E',
            replace: true,
            scope: {
                uploader: '='
            },
            link: function (scope, element, attrs) {
                element.find('a').click(function (e) {
                    element.find('input[type="file"]').click();
                });
            },
            template: '<div class="file-uploader">'
                    +   '<a href="#">'
                    +       'Upload File'
                    +       '<i class="icon_cloud-upload_alt"></i>'
                    +   '</a>'
                    +   '<input type="file" nv-file-select uploader="uploader" style="display: none;" />'
                    + '</div>'
        };
    }
]);