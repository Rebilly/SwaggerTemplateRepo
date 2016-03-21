var gulp = require('gulp-npm-run')(require('gulp'));
var connect = require('gulp-connect');
var cors = require('cors');
var run = require('gulp-run');
var path = require('path');

var DIST_DIR = 'web_deploy';
var SWAGGER_UI_DIST = path.dirname(require.resolve('swagger-ui'));

gulp.task('serve', ['watch'], function() {
  connect.server({
    root: [DIST_DIR],
    livereload: true,
    port: 3000,
    middleware: function (connect, opt) {
      return [
        connect().use('/swagger-ui', connect.static(SWAGGER_UI_DIST)),
        cors()
      ]
    }
  });
});
/*
 * build task is populated from package.json by gulp-npm-run
 */
gulp.task('reload', ['build'], function () {
  gulp.src(DIST_DIR).pipe(connect.reload())
});

gulp.task('watch', function () {
  gulp.watch(['spec/**/*', 'web/**/*'], ['reload']);
});
