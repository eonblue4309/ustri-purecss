module.exports = (grunt) ->

  grunt.initConfig

    clean: ['public']

    jade:
      compile:
        options:
          pretty: true
          client: false
        files: [
          cwd: 'src/jade'
          src: ['**/*.jade', '!**/partials/**/*.jade']
          dest: 'public'
          expand: true
          ext: '.html'
        ]

    sass:
      options:
        outputStyle: 'expanded'
      dist:
        files: 'public/style.css': 'src/sass/ustri.sass'

    watch:
      compile:
        files: ['src/**/*.jade', 'src/**/*.sass']
        tasks: ['jade', 'sass']
        options:
          livereload: true
          port: 9000

    'http-server':
      dev:
        root: 'public'
        port: 8383
        host: '127.0.0.1'
        showDir : true
        autoIndex: true
        ext: "html"
        runInBackground: true

    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-jade'
    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-sass'
    grunt.loadNpmTasks 'grunt-http-server'

    grunt.registerTask 'default', ['http-server', 'watch']
    grunt.registerTask 'compile', ['clean', 'sass', 'jade']