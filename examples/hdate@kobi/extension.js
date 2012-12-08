// based on amiad hdate#hatul.info Hdate extension
// see:
//    https://github.com/amiad/gnome-hdate

const St = imports.gi.St;
const PanelMenu = imports.ui.panelMenu;
const PopupMenu = imports.ui.popupMenu;
const Main = imports.ui.main;
const Lang = imports.lang;
const Mainloop = imports.mainloop;
const Gettext = imports.gettext.domain('hdate_button');
const _ = Gettext.gettext;
const Hdate = imports.gi.LibHdateGlib.Hdate;

function init() 
{
    return new HdateButton();
}

function HdateButton()
{
    this._init();
}

HdateButton.prototype = {
    __proto__: PanelMenu.Button.prototype,

    _init: function() {
        PanelMenu.Button.prototype._init.call(this, St.Align.START);
        
        this.updateTimeout = 60000;
        this.isRunning = false;
        this.forceHebrew = true;

        this._label = new St.Label();
        this.actor.add_actor(this._label);
        
        // init the hebrew date object
        this.h = Hdate.new();
        this.jd = 0;
        
        // get times for tel aviv (utc time)
        this.h.set_longitude(34.77);
        this.h.set_latitude(32.07);

        // force long format hebrew output
        this.h.set_use_hebrew( this.forceHebrew );
        this.h.set_use_short_format( false );
    },

    enable: function() {
        Main.panel._centerBox.insert_child_at_index(this.actor, 0);
        Main.panel._menus.addMenu(this.menu);
        
        this.jd = 0;
        this.isRunning = true; 
        this._updateLable();
    },

    disable: function() {
        this.isRunning = false; 
        this.menu.removeAll();
        Main.panel._menus.removeMenu(this.menu);
        Main.panel._rightBox.remove_actor(this.actor);
    },

    _onButtonPress: function(actor, event) {
        this.menu.removeAll();
        this._buildContextMenu(); 
       
        return PanelMenu.Button.prototype._onButtonPress.call(this, actor, event);
    },

    _buildContextMenu: function() {
        var sunrise = this.h.get_sunrise()
        var sunset = this.h.get_sunset()
        var first_light = this.h.get_first_light()
        var talit = this.h.get_talit()
        var first_stars = this.h.get_first_stars()
        var three_stars = this.h.get_three_stars()

        // print times in israel tz=2 dst=0
        // require for min_to_string function
        this.h.set_tz(2);
        this.h.set_dst(0);

        this.sunrise = new PopupMenu.PopupMenuItem(
            _("Sunrise - ") + this.h.min_to_string(sunrise));
        this.menu.addMenuItem(this.sunrise);
        this.ef = new PopupMenu.PopupMenuItem(
            _("Sunset - ") + this.h.min_to_string(sunset));
        this.menu.addMenuItem(this.ef);
        
        this.menu.addMenuItem(new PopupMenu.PopupSeparatorMenuItem());

        this.first_light = new PopupMenu.PopupMenuItem(
            _("First light - ") + this.h.min_to_string(first_light));
        this.menu.addMenuItem(this.first_light);
        this.first_stars = new PopupMenu.PopupMenuItem(
            _("First stars - ") + this.h.min_to_string(first_stars));
        this.menu.addMenuItem(this.first_stars);
        this.three_stars = new PopupMenu.PopupMenuItem(
            _("Three stars - ") + this.h.min_to_string(three_stars));
        this.menu.addMenuItem(this.three_stars);
    },
    
    _updateLable: function () {
        // check extension state
        if ( !this.isRunning ) {
            return;
        }
        
        // set the h object date to today 
        // and repaint if we did not paint this day
        this.h.set_today();
        if ( this.h.get_julian() != this.jd ) {
            // create the hebrew date label. we can use the standart this.h.to_string()
            // function or create the string.
            let label_string = this.h.get_int_string( this.h.get_hday() );
            label_string += " " + this.h.get_hebrew_month_string( this.h.get_hmonth() );
            label_string += " " + this.h.get_int_string( this.h.get_hyear() );
            
            // check for holiday
            let holyday = this.h.get_holyday();
            if (holyday != 0) {
              label_string += ", " + this.h.get_holyday_string( holyday );
            }
            
            this._label.set_text(label_string);
        }
        
        // remember the last day painted
        this.jd = this.h.get_julian();
        
        // reset the timeout
        Mainloop.timeout_add( this.updateTimeout, Lang.bind(this, function() {
            this._updateLable();
        }));
    }
}

