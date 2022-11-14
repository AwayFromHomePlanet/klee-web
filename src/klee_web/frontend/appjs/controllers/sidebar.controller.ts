import {controllers} from './controllers.module';

controllers.controller('SidebarCtrl', [
    '$scope', 'Project', 'File', 'FileUploader', '$cookies',
    function($scope, Project, File, FileUploader, $cookies) {

        function refreshFiles (projectId, selectedFileId) {
            var refreshFiles = File.query({
                projectId: projectId
            }).$promise;

            refreshFiles.then(function (files) {
                $scope.files = files;
                var selectedFile = _.findWhere($scope.files, {
                    id: selectedFileId
                });
                $scope.selectFile(selectedFile);
            });
        };

        $scope.projectToAdd = false;
        $scope.newFile = {
            name: '',
            showForm: false
        };
        $scope.newProjectOpt = {
            name: 'Add New Project',
            auth: false
        };

        $scope.uploader = new FileUploader({
            withCredentials: true,
            autoUpload: true,
            removeAfterUpload: true,
            headers: {
                'X-CSRFToken': $cookies.csrftoken
            },
            onSuccessItem: function (item, response, status, headers) {
                refreshFiles($scope.selectedProject.id, response.id);
            },
            onErrorItem: function (item, response, status, headers) {
                alert('Upload failed. Please make sure you\'re uploading a valid file and try again.');
            },
        });

        Project.query().$promise.then(function(projects) {
            $scope.projects = projects;
            $scope.projects.push($scope.newProjectOpt);

            if (projects.length > 0) {
                $scope.$parent.selectedProject = projects[0];
            }
        });

        $scope.$watch('selectedProject', function(project) {
            if (!(_.isNull(project) || _.isUndefined(project))) {
                if (project.name == 'Add New Project') {
                    $scope.projectToAdd = true;
                } else {
                    // Update file uploader
                    $scope.uploader.url = 'api/projects/' + project.id + '/files/upload/';

                    refreshFiles(project.id, project.defaultFile);
                }
            } else {
                $scope.files = [];
                $scope.resetLoadedFile();
            }
        });

        $scope.selectFile = function (file) {
            if (!angular.isUndefined(file)) {
                var selectedProject = $scope.$parent.selectedProject;
                $scope.$parent.submission = file;
                selectedProject.defaultFile = file.id;
                for (opt in $scope.opts) {
                  if (file.runConfiguration[opt].size) {
                    $scope.opts[opt] = true;
                  }
                }
                $scope.$parent.config = file.runConfiguration;
                if (!selectedProject.example) {
                    selectedProject.$update();
                }
            } else {
                $scope.resetLoadedFile();
            }
        };

        $scope.resetProjectSelector = function() {
            $scope.projectToAdd = false;
            $scope.$parent.selectedProject = null;
        };

        $scope.addProject = function (projectName) {
            var newProject = new Project({
                name: projectName
            });
            newProject.$save(function(project) {
                $scope.projects.push(project);
                $scope.$parent.selectedProject = project;
                $scope.projectToAdd = false;
            });
        };

        $scope.showAddFile = function() {
            $scope.newFile.showForm = true;
        };

        $scope.addFile = function() {
            var filename = $scope.newFile.name;
            // Hacky force append '.c'
            var re = /\.c$/;
            if (!re.test(filename)) {
                filename = filename + '.c';
            }

            var blankFile = new File({
                projectId: $scope.$parent.selectedProject.id,
                name: filename,
                code: '// Edit ' + filename,
                runConfiguration: {
                    symArgs: {
                        range: [0, 0],
                        size: 0
                    },
                    symFiles: {
                        num: 0,
                        size: 0
                    },
                    symIn: {
                        size: 0
                    },
                    options: '',
                    arguments: ''
                }
            });

            blankFile.$save(function(newFile) {
                $scope.files.unshift(newFile);
                $scope.newFile.name = '';
                $scope.newFile.showForm = false;

                $scope.selectFile(blankFile);
            });
        };

        $scope.deleteFile = function(file) {
            file.$delete(function () {
                // If we're deleting the current file, reset the editor
                if (file == $scope.submission) {
                    $scope.resetLoadedFile();
                }

                // Remove from file list
                $scope.files = _.without($scope.files, file);
            });
        };

    }
]);