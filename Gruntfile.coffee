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
        files: 'public/style.css': 'src/sass/style.sass'

    watch:
      jade:
        files: ['src/**/*.jade', 'src/**/*.sass']
        tasks: ['jade', 'sass']

    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-jade'
    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-sass'

    grunt.registerTask 'default', ['watch']
    grunt.registerTask 'compile', ['clean', 'sass', 'jade']