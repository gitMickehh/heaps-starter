import h2d.Text.Align;

class Base2D extends hxd.App {

    public static var instance(get, null): Base2D;

    private static function get_instance():Base2D{
      if(instance == null) instance = new Base2D();
      return instance;
    }

    var obj : h2d.Object;
    var tf : h2d.Text;
  
    override function init() {
      super.init();

      // creates a new object and put it at the center of the sceen
      obj = new h2d.Object(s2d);
      obj.x = Std.int(s2d.width / 2);
      obj.y = Std.int(s2d.height / 2);
  
      // load the haxe logo png into a tile
      var tile = hxd.Res.hxlogo.toTile();
  
      // change its pivot so it is centered
      tile = tile.center();

      new h2d.Bitmap(tile, obj);
  
      // load a bitmap font Resource
      var font = hxd.Res.customFont.toFont();
  
      // creates another text field with this font
      var tf = new h2d.Text(font, s2d);
      tf.textAlign = h2d.Text.Align.Center;
      tf.textColor = 0xFFFFFF;
      tf.dropShadow = { dx : 0.5, dy : 0.5, color : 0xFF0000, alpha : 0.8 };
      tf.text = "Mickehh";
  
      tf.x = s2d.width / 2;
      tf.y = 20;
      tf.scale(5);
    }
  
    // if we the window has been resized
    override function onResize() {
  
      if( obj == null ) return;
  
      // center our object
      obj.x = Std.int(s2d.width / 2);
      obj.y = Std.int(s2d.height / 2);
  
      // move our text up/down accordingly
      if( tf != null ) 
        {
          tf.x =  Std.int(s2d.width / 2);
          tf.y = s2d.height - 20;
        }
    }
  
    override function update(dt:Float) {
      // rotate our object every frame
      if( obj != null ) obj.rotation += 0.01 * dt;
    }
  }