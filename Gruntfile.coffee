module.exports = (grunt) ->
  grunt.initConfig
    sass: # Task
      dist: # Target
        files: # Dictionary of files
          'style.css': 'style.scss' # 'destination': 'source'

  grunt.loadNpmTasks('grunt-sass')
  grunt.registerTask('default', ['sass'])
