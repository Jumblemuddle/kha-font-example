package game;

import kha.Assets;
import kha.Color;
import kha.Framebuffer;
import kha.Font;
import kha.Key;
import kha.Scheduler;
import kha.ScreenCanvas;
import kha.System;
import kha.graphics2.Graphics;
import kha.math.FastMatrix3;

class Scene {

    var background: Color;

    var width: Int;
    var height: Int;

    public function new(?color: Color) {
        this.background = (color != null)? color : Color.fromFloats(0.2, 0.2, 0.2);

        width = ScreenCanvas.the.width;
        height = ScreenCanvas.the.height;

        resize(width, height);
    }

    @:final
    public function render(framebuffer: Framebuffer) {
        var g = framebuffer.g2;

        predraw(g);

        g.begin(true, background);

        draw(g);

        g.end();

        if (width != ScreenCanvas.the.width || height != ScreenCanvas.the.height) {
            width = ScreenCanvas.the.width;
            height = ScreenCanvas.the.height;

            resize(width, height);
        }
    }

    function predraw(g: Graphics) {}

    function draw(g: Graphics) {}

    public function resize(width: Int, height: Int) {}

    public function checkMouseDown(x: Int, y: Int): Bool {
        return false;
    }

    public function checkMouseUp(x: Int, y: Int): Bool {
        return false;
    }

    public function checkMouseMove(x: Int, y: Int, xd: Int, yd: Int): Bool {
        return false;
    }

    public function checkMouseWheel(delta: Int) {
        return false;
    }

    public function checkKeyDown(key: Key, char: String) {
        return false;
    }

    public function checkKeyUp(key: Key, char: String) {
        return false;
    }
}
