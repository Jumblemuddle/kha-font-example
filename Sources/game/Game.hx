package game;

import kha.Assets;
import kha.Color;
import kha.Framebuffer;
import kha.Image;
import kha.Key;
import kha.Scheduler;
import kha.ScreenCanvas;
import kha.System;
import kha.graphics2.Graphics;
import kha.input.Keyboard;
import kha.input.Mouse;

import game.scenes.*;

class Game {

    public static var changeStart: Float;

    public static var scene: Scene;

    public static function start() {
        Assets.loadEverything(function () {
            scene = new ScreenA();

            Mouse.get().notify(mouseDownListener, mouseUpListener, mouseMoveListener, mouseWheelListener);
            Keyboard.get().notify(keyDownListener, keyUpListener);

            System.notifyOnRender(render);
        });
    }

    static function render(framebuffer: Framebuffer) {
        scene.render(framebuffer);
    }

    static function mouseDownListener(button: Int, x: Int, y: Int) {
        scene.checkMouseDown(x, y);
    }

    static function mouseUpListener(button: Int, x: Int, y: Int) {
        scene.checkMouseUp(x, y);
    }

    static function mouseMoveListener(x: Int, y: Int, xd: Int, yd: Int) {
        scene.checkMouseMove(x, y, xd, yd);
    }

    static function mouseWheelListener(delta: Int) {
        scene.checkMouseWheel(delta);
    }

    static function keyDownListener(key: Key, char: String) {
        scene.checkKeyDown(key, char);
    }

    static function keyUpListener(key: Key, char: String) {
        scene.checkKeyUp(key, char);
    }

    public static function resize(width: Int, height: Int) {
        scene.resize(width, height);
    }
}
