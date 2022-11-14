var config = {
  lib: './node_modules',
  assets: './frontend/assets',
  sass: './frontend/sass',
  app: './frontend/appjs',
  frontend_dist: './frontend/static/frontend/dist'
};

module.exports = function (grunt) {

    // Project configuration.
    grunt.initConfig({
        config: config,
        pkg: grunt.file.readJSON('package.json'),
        copy: {
        	dist: {
        		files: [
                    // Copy assets to dist
                    {
                        expand: true,
                        cwd: '<%= config.assets %>',
                        src: ['**/*'],
                        dest: '<%= config.frontend_dist %>'
                    },
        			// Copy Bootstrap sass to sass working dir
        			{
        				expand: true,
        				cwd: '<%= config.lib %>/bootstrap-sass-official/assets/stylesheets/bootstrap',
        				src: ['**/*'],
        				dest: '<%= config.sass %>/bootstrap'
        			},
        			// Copy Bootstrap assets to dist dirs
        			{
        				expand: true,
                        cwd: '<%= config.lib %>/bootstrap-sass-official/assets/fonts',
                        src: ['**/*'],
                        dest: '<%= config.frontend_dist %>/fonts'
                    },
                    // Elegant Icons
                    {
                        expand: true,
        				cwd: '<%= config.lib %>/elegant-icons/fonts',
                        src: ['*'],
                        dest: '<%= config.frontend_dist %>/css/vendor/fonts'
                    },
                    // Animate.css
                    {
                        expand: true,
                        cwd: '<%= config.lib %>/animate.css',
                        src: ['animate.min.css'],
                        dest: '<%= config.frontend_dist %>/css/vendor'
                    },
                    {
                        expand: true,
                        cwd: '<%= config.lib %>/elegant-icons/css',
                        src: ['style.css'],
                        dest: '<%= config.frontend_dist %>/css/vendor/eleganticons'
                    },
                    {
                        expand: true,
                        cwd: '<%= config.lib %>/font-awesome/css',
                        src: ['font-awesome.css'],
                        dest: '<%= config.frontend_dist %>/css/vendor/font-awesome'
                    },
                    {
                        expand: true,
                        cwd: '<%= config.lib %>/font-awesome/fonts',
                        src: ['fontawesome-webfont.woff2',
                              'fontawesome-webfont.woff',
                              'fontawesome-webfont.ttf'],
                        dest: '<%= config.frontend_dist %>/css/vendor/fonts'
                    },
                    {
                        expand: true,
                        cwd: '<%= config.lib %>/bootstrap-social',
                        src: ['bootstrap-social.css'],
                        dest: '<%= config.frontend_dist %>/css/vendor/bootstrap-social'
                    },
                    // Codemirror
                    {
                        expand: true,
                        cwd: '<%= config.lib %>/codemirror/lib',
                        src: 'codemirror.css',
                        dest: '<%= config.frontend_dist %>/css/vendor/codemirror'
        			},
                    {
                        expand: true,
                        cwd: '<%= config.lib %>/codemirror/theme',
                        src: ['*.css'],
                        dest: '<%= config.frontend_dist %>/css/vendor/codemirror/theme'
                    },
                    // Angular Codemirror
                    {
                        expand: true,
                        cwd: '<%= config.lib %>/angular-ui-codemirror',
                        src: 'ui-codemirror.min.js',
                        dest: '<%= config.frontend_dist %>/js/vendor'
                    },
                    // JQuery UI slider
                    {
                        expand: true,
                        cwd: '<%= config.lib %>/jquery-ui/themes/base/minified',
                        src: 'jquery-ui.min.css',
                        dest: '<%= config.frontend_dist %>/css/vendor'
                    },
                    {
                        expand: true,
                        cwd: '<%= config.lib %>/jquery-ui/ui/minified',
                        src: 'jquery-ui.min.js',
                        dest: '<%= config.frontend_dist %>/js/vendor'
                    },
                    {
                        expand: true,
                        cwd: '<%= config.lib %>/nanobar',
                        src: 'nanobar.min.js',
                        dest: '<%= config.frontend_dist %>/js/vendor'
                    }
        		]
        	}
        },
        concat: {
            dist: {
                files: [
                    {
                        '<%= config.frontend_dist %>/js/vendor/lib.min.js': [
                            '<%= config.lib %>/jquery/dist/jquery.min.js',
                            '<%= config.lib %>/underscore/underscore-min.js',
                        ],
                        '<%= config.frontend_dist %>/js/vendor/angular-custom.min.js':
                            [
                                '<%= config.lib %>/angular/angular.min.js',
                                '<%= config.lib %>/angular-resource/angular-resource.min.js',
                                '<%= config.lib %>/angular-cookies/angular-cookies.min.js',
                                '<%= config.lib %>/angular-animate/angular-animate.min.js',
                            ],
                        '<%= config.frontend_dist %>/js/vendor/angular-bootstrap.min.js':
                            [
                                '<%= config.lib %>/angular-bootstrap/ui-bootstrap.min.js',
                                '<%= config.lib %>/angular-bootstrap/ui-bootstrap-tpls.min.js',
                            ],
                        '<%= config.frontend_dist %>/js/vendor/angular-file-upload.min.js':
                            [
                                '<%= config.lib %>/angular-file-upload/angular-file-upload.min.js',
                                '<%= config.lib %>/es5-shim/es5-shim.min.js',
                                '<%= config.lib %>/es5-shim/es5-sham.min.js',
                            ],
                    }
                ]
            }
        },
        uglify: {
        	dist: {
        		files: {
                    '<%= config.frontend_dist %>/js/vendor/bootstrap.min.js': [
                        '<%= config.lib %>/bootstrap-sass-official/assets/javascripts/bootstrap.js',
                        '<%= config.lib %>/bootstrap-sass-official/assets/javascripts/bootstrap/*.js',
                    ],
                    '<%= config.frontend_dist %>/js/vendor/codemirror.min.js': [
                        '<%= config.lib %>/codemirror/lib/codemirror.js',
                        // C syntax
                        '<%= config.lib %>/codemirror/mode/clike/clike.js',
                    ],
                    '<%= config.frontend_dist %>/js/vendor/angular-ui-slider.min.js': [
                        '<%= config.lib %>/angular-ui-slider/src/slider.js',
                    ],

                    // Application JS
        			'<%= config.frontend_dist %>/js/app.min.js': [
                        '<%= config.frontend_dist %>/js/app.js'
                    ]
        		}
        	}
        },
        sass: {
        	dist: {
        		options: {
        			style: 'compressed'
        		},
                files: [
                    {
                        expand: true,
                        cwd: '<%= config.sass %>',
                        src: ['*.scss'],
                        dest: '<%= config.frontend_dist %>/css',
                        ext: '.css'
                    }
                ]
            }
        },
        watch: {
            sass: {
                files: [
                    '<%= config.sass %>/*.scss',
                    '<%= config.sass %>/components/*.scss',
                ],
                tasks: ['sass'],
                options: {
                    spawn: false
                }
            },
            app: {
                files: [
                    '<%= config.app %>/*.js'
                ],
                tasks: ['uglify'],
                options: {
                    spawn: false
                }
            }
        },
        ts: {
            default: {
                src: ['<%= config.app %>/**/*.ts'],
                dest: '<%= config.frontend_dist %>/js/app.js'
            },
            options: {
                sourceMap: false,
                module: 'amd'
            }
        }
    });

	grunt.loadNpmTasks("grunt-contrib-sass");
	grunt.loadNpmTasks("grunt-contrib-watch");
    grunt.loadNpmTasks('grunt-contrib-copy');
	grunt.loadNpmTasks('grunt-contrib-concat');
	grunt.loadNpmTasks('grunt-contrib-uglify-es');
    grunt.loadNpmTasks('grunt-ts');

	grunt.registerTask('default', [
        'concat',
        'copy',
        'ts',
		'uglify',
		'sass',
	]);

};
