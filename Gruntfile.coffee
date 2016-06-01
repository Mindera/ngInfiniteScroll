module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-uglify'

  sauceUser = 'pomerantsevp'
  sauceKey = '497ab04e-f31b-4a7b-9b18-ae3fbe023222'

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    meta:
      banner: '/* <%= pkg.name %> - v<%= pkg.version %> - <%= grunt.template.today("yyyy-mm-dd") %> */\n'
    clean:
      options:
        force: true
      build: ["compile/**", "build/**"]
    uglify:
      options:
        banner: '<%= meta.banner %>'
      dist:
        src: ['src/ng-infinite-scroll.js']
        dest: 'build/ng-infinite-scroll.min.js'
    connect:
      testserver:
        options:
          port: 8000
          hostname: '0.0.0.0'
          middleware: (connect, options) ->
            base = if Array.isArray(options.base) then options.base[options.base.length - 1] else options.base
            [connect.static(base)]


  grunt.registerTask 'default', ['clean', 'uglify']
