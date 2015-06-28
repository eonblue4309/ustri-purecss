module.exports = (grunt) ->
  
  grunt.initConfig
 
    jade:
      compile:
        options:
          pretty: true
          client: false
        files: [
          cwd: 'src'
          src: '**/*.jade'
          dest: 'public'
          expand: true
          ext: '.html'
        ]

    sass:
      options:
        outputStyle: 'expanded'
      dist:
        files: 'public/stylez.css': 'src/sass/style.sass'

    watch:
      jade:
        files: ['src/**/*.jade']
        tasks: ['jade']
      sass:
        files: ['src/**/*.sass']
        tasks: ['sass']

    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-jade'
    grunt.loadNpmTasks 'grunt-sass'

    grunt.registerTask 'default', ['watch']
    grunt.registerTask 'libsass', ['sass']