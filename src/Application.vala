public class Application : Gtk.Application{
     public Application(){
          Object(
               application_id: "com.github.fidelisakilan.testgtk",
               flags: ApplicationFlags.FLAGS_NONE
          );
     }
     protected override void activate(){
          var window = new testgtk.Window(this);
     // build_window();
          add_window(window);
     }
}
