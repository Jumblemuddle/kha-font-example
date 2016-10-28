'use strict';

var gulp    = require('gulp'),
    gutil   = require('gulp-util'),
    shell   = require('gulp-shell'),
    express = require('express'),
    path    = require('path'),
    tinylr  = require('tiny-lr'),
    clr     = require('connect-livereload');

var lr = tinylr();
lr.listen(35729, function () {
    gutil.log('LR Listening on', 35729);
});

var app = express();
app.use(clr({
    port: 35729
}));
app.use(express.static(path.resolve('./build/html5')));
app.listen(8080, function () {
    gutil.log('Listening on', 8080);
});

gulp.watch('Sources/**/*.hx', ['compile-reload']);

gulp.task('compile-reload', ['compile'], function () {
    lr.changed({
        body: {
            files: ['./build/html5/kha.js', './build/html5/index.html']
        }
    });
});

gulp.task('compile', shell.task([ 'node Kha/make html5' ]));

//gulp.watch(['./build/html5/*'], function (evt) {
//    gutil.log(gutil.colors.cyan(evt.path), 'changed');
//    lr.changed({
//        body: {
//            files: [evt.path]
//        }
//    });
//});

gulp.task('default', function () {

});
