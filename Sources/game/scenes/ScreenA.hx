package game.scenes;

import kha.Assets;
import kha.Color;
import kha.Image;
import kha.Key;
import kha.Scheduler;
import kha.graphics2.Graphics;

class ScreenA extends Scene {

    public function new() {
        super(Color.Red);
    }

    override function checkKeyDown(key: Key, char: String): Bool {
        if (char == "b") {
            Game.scene = new ScreenB();
            return true;
        }
        return false;
    }

    override public function checkMouseDown(x: Int, y: Int): Bool {
        Game.scene = new ScreenB();
        return true;
    }
}
