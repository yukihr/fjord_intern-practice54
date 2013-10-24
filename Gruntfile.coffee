module.exports = (grunt) ->
  pkg = grunt.file.readJSON("package.json")
  grunt.initConfig
    pkg: pkg
    sass: # Task
      dist: # Target
        files: # Dictionary of files
          'style.css': 'style.sass' # 'destination': 'source'
    connect:
      livereload:
        options:
          port: 9000
    watch:
      css:
        files: ['*.sass']
        tasks: ['sass']
        options:
          # WARN: Don't forget to enable livereload on html
          # https://github.com/gruntjs/grunt-contrib-watch#enabling-live-reload-in-your-html
          livereload: true
          spawn: false

  # grunt.loadNpmTasks('grunt-contrib-sass')
  # grunt.loadNpmTasks('grunt-contrib-watch')
  for name, version of pkg.devDependencies
    if name.substring(0, 6) is 'grunt-'
      grunt.loadNpmTasks(name)
  grunt.registerTask('default', ['connect', 'watch'])
