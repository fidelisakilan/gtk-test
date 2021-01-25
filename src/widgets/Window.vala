public class testgtk.Window : Gtk.ApplicationWindow{
     public GLib.Settings settings;
     public Gtk.Stack stack {get; set;}
     public Window(Application app){
          Object(
               application:app
          );
     }
     construct{

         border_width = 10;
         window_position = Gtk.WindowPosition.CENTER;
         set_default_size(350,80);
         settings = new GLib.Settings("com.github.fidelisakilan.testgtk");
         move(settings.get_int("pos-x"),settings.get_int("pos-y"));
         resize(settings.get_int("window-width"),settings.get_int("window-height"));
         delete_event.connect(e => {
              return before_destroy();
         });

         stack = new Gtk.Stack();
         stack.expand = true;
         var pending = new Gtk.Grid();
         pending.add(new Gtk.Label("Pending"));
         var completed = new Gtk.Grid();
         completed.add(new Gtk.Label("Completed"));
         stack.add_titled(pending,"pending","Pending");
         stack.add_titled(completed,"completed","Completed");
         add(stack);

         var headerbar = new testgtk.HeaderBar(this);
         set_titlebar(headerbar);
         show_all();
     }
     public bool before_destroy(){
          int width,height,x,y;
          get_size(out width,out height);
          get_position(out x,out y);
          settings.set_int("pos-x",x);
          settings.set_int("pos-y",y);
          settings.set_int("window-width",width);
          settings.set_int("window-height",height);
          return false;
     }
}
