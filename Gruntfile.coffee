module.exports = (grunt) ->
  pkg = grunt.file.readJSON("package.json")
  grunt.initConfig
    pkg: pkg
    sass:
      dist:
        options:
          compass: true
        files:
          'style.css': 'style.sass'
    # for livereload
    # Install Browser Extension:
    #   http://feedback.livereload.com/knowledgebase/articles/86242-how-do-i-install-and-use-the-browser-extensions-
    connect:
      livereload:
        options:
          port: 9000
    watch:
      css:
        files: ['*.sass']
        tasks: ['sass']
        options:
          livereload: true
          spawn: false

  for name, version of pkg.devDependencies
    if name.substring(0, 6) is 'grunt-'
      grunt.loadNpmTasks(name)

  grunt.registerTask('default', ['connect', 'watch'])
