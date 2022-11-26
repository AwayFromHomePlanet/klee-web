var controllers = angular.module('controllers', []);

controllers.controller('MainCtrl', [
    '$scope', '$http', '$rootScope', 'Project', 'File', '$interval',
    function($scope, $http, $rootScope, Project, File, $interval) {

        $scope.submission = {
            name: null,
            code: ''
        };
        
        $scope.opts = {
            symArgs: false,
            symFiles: false,
            symIn: false,
            options: false,
            arguments: false
        };
        
        $scope.config = {
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
        
        $scope.submission.runConfiguration = angular.copy($scope.config);
        $scope.defaultSubmission = angular.copy($scope.submission);

        $scope.progress = [];
        $scope.result = {};
        $scope.submitted = false;

        $scope.editor = null;
        $scope.selectedProject = null;

        $scope.projects = [];
        $scope.files = [];

        $scope.toggleSymArgs = function ($event) {
            $event.preventDefault();
            $event.stopPropagation();
            $scope.opts.symArgs = !$scope.opts.symArgs;
        };

        $scope.toggleSymFiles = function ($event) {
            $event.preventDefault();
            $event.stopPropagation();
            $scope.opts.symFiles = !$scope.opts.symFiles;
        };
        
        $scope.toggleSymIn = function ($event) {
            $event.preventDefault();
            $event.stopPropagation();
            $scope.opts.symIn = !$scope.opts.symIn;
        };

        $scope.toggleOptions = function ($event) {
            $event.preventDefault();
            $event.stopPropagation();
            $scope.opts.options = !$scope.opts.options;
            $scope.opts.arguments = !$scope.opts.arguments;
        };
        
        $scope.resetLoadedFile = function() {
            $scope.submission = angular.copy($scope.defaultSubmission);
        }

        var saveTimeout = null;
        var lastSaveTime = 0;
        const MIN_SAVE_INTERVAL = 2000; // 2 seconds

        var saveSubmission = function() {
            var submission = $scope.submission;
            if (!angular.isUndefined($scope.submission.$update) && !$scope.selectedProject.example) {
                File.update({}, submission);
            }

            lastSaveTime = Date.now();
            saveTimeout = null;
        };

        $scope.$watch('submission', function(newVal, oldVal) {
            if (newVal !== oldVal && saveTimeout == null) {
                var nextSave = ((lastSaveTime + MIN_SAVE_INTERVAL) - Date.now());
                var timeToSave = Math.max(nextSave, 0);
                saveTimeout = setTimeout(saveSubmission, timeToSave);
            }
        }, true);
        
        var buildConfiguration = function() {
            for (opt in $scope.opts) {
                $scope.submission.runConfiguration[opt] 
                    = $scope.opts[opt] ? $scope.config[opt] 
                    : $scope.defaultSubmission.runConfiguration[opt]
            }
        };

        $scope.processForm = function(submission) {
            buildConfiguration();
            $rootScope.startNanobar();
            $scope.submitted = true;
            $scope.intermediate_results = [];
            $scope.result = {};
            $scope.progress = [];
            $scope.progress.push('Job queued!');

            // Send data to submit endpoint
            $http
                .post('/api/jobs/submit/', submission)

            // We get a task id from submitting!
            .success(
              function(data, status, headers) {
                taskId = data.taskId;
                var fetch = $interval(function () {
                  $http.get('/jobs/status/' + taskId + '/').success(function(data, status, headers) {
                    m = angular.fromJson(data);
                    var type = m['type'];
                    if(type == 'notification') {
                      data = angular.fromJson(m.data);
                      $scope.progress.push(data.message);
                    } else {
                      $scope.submitted = false;
                      data = angular.fromJson(m.data);
                      if(type == 'job_complete') $scope.progress.push('Done!');
                      $scope.result = data;
                      $rootScope.finishNanobar();
                      $interval.cancel(fetch);
                    }
                  });
                }, 500);

              }
            )

            // We didn't even get a task back from submit
            .error(
              function(data, status, headers) {
                console.debug('Error! ', data);
                $rootScope.finishNanobar();
              }
            );
          };

        $scope.codemirrorLoaded = function(_editor) {
            $scope.editor = _editor;

            _editor.setOption('viewportMargin', 5);
            _editor.setOption('lineWrapping', true);
            _editor.setOption('lineNumbers', true);
            _editor.setOption('mode', {
                name: 'text/x-csrc',
                useCPP: true
            });
            _editor.setOption('readOnly', 'nocursor');
            _editor.setOption('theme', 'neo');
        };

        $scope.drawCoverage = function(coverage) {
            $scope.editor.setValue($scope.submission.code);

            var linesHit = 0;
            var linesTotal = 0;
            var lines = coverage.lines;
            for (var i = 0; i < lines.length; i++) {
                var hit = lines[i].hit;
                if (hit == null) {
                    $scope.editor.addLineClass(i, 'wrap', 'line-null');
                } else {
                    if (hit > 0) {
                        linesHit += 1;
                        $scope.editor.addLineClass(i, 'wrap', 'line-hit');
                    } else {
                        $scope.editor.addLineClass(i, 'wrap', 'line-miss');
                    }
                    linesTotal += 1;
                }
            }
            $scope.editor.addLineClass(lines.length, 'wrap', 'line-null');

            $scope.linePercentage = (linesHit / linesTotal).toFixed(2) * 100;

            $scope.editor.focus();
        };

        $scope.$watch('result', function (result) {
            if (!(angular.isUndefined(result.coverage) || result.coverage === null)) {
                $scope.drawCoverage(result.coverage[0]);
            }
        });
    }
]);

