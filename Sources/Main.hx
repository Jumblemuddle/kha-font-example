package;

import kha.System;
import game.Game;

import kha.Scheduler;

#if js
import js.Browser;
import js.html.CanvasElement;
#end

class Main {

    public static function main () {
        #if js
        var node = Browser.document.createElement("meta");
        node.setAttribute("name", "Viewport");
        node.setAttribute("content", "width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no");
        Browser.document.head.appendChild(node);

        var window = Browser.window;
        var canvas: CanvasElement = cast Browser.document.getElementById("khanvas");

        function resize() {
            canvas.style.width = cast window.innerWidth;
            window.setTimeout(function () {
                canvas.style.height = cast window.innerHeight;
            }, 0);

            Game.resize(cast window.innerWidth, cast window.innerHeight);
        }

        window.addEventListener("resize", resize, false);
        window.addEventListener("orientationchange", resize, false);

        Browser.document.body.style.margin = "0";
        Browser.document.body.style.overflow = "hidden";

        canvas.style.position = "absolute";
        canvas.style.left = canvas.style.top = "0";
        canvas.style.width = canvas.style.height = "100%";
        #end

        System.init({title: "Tree"}, function() {
            Game.start();
        });
    }
}
