package game.scenes;

import kha.Assets;
import kha.Color;
import kha.Image;
import kha.Key;
import kha.Scheduler;
import kha.graphics2.Graphics;

class ScreenB extends Scene {

    public function new() {
        super(Color.Blue);
    }

    override function draw(g: Graphics) {
        g.color = Color.White;
        g.font = Assets.fonts.opensans;
        g.drawString("b", 0, 0);
    }

    override function checkKeyDown(key: Key, char: String): Bool {
        if (char == "a") {
            Game.scene = new ScreenA();
            return true;
        }
        return false;
    }

    override public function checkMouseDown(x: Int, y: Int): Bool {
        Game.scene = new ScreenA();
        return true;
    }
}
