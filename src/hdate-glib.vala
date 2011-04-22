/* hdate-glib.vala
 *
 * Copyright (C) 2010  Yaacov Zamir
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *  
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *  
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 * 
 * Author:
 * 	Yaacov Zamir <kobi.zamir@gmail.com>
 */

using GLib;
using LibHdate;

namespace LibHdateGlib {
	public class Hdate : Object {
	
		public HdateC hdate;
	
		public Hdate() {
			hdate = new HdateC();
			hdate.set_gdate();
		}
		
		public void set_gdate (int? d = 0, int? m = 0, int? y = 0) {
			hdate.set_gdate (d, m, y);
		}

		public void set_hdate (int d, int m, int y) {
			hdate.set_hdate (d, m, y);
		}
		
		public void set_jd (int jd) {
			hdate.set_jd (jd);
		}
		
		public int get_parasha (bool? diaspora = false) {
			return hdate.get_parasha (diaspora);
		}
		
		public int get_holyday (bool? diaspora = false) {
			return hdate.get_holyday (diaspora);
		}
		
		public int get_omer_day() {
			return hdate.get_omer_day();
		}
		
		public int get_gday () {
			return hdate.get_gday ();
		}
		
		public int get_gmonth () {
			return hdate.get_gmonth ();
		}
		
		public int get_gyear () {
			return hdate.get_gyear ();
		}
		
		public int get_hday () {
			return hdate.get_hday ();
		}
		
		public int get_hmonth () {
			return hdate.get_hmonth ();
		}
		
		public int get_hyear () {
			return hdate.get_hyear ();
		}
		
		public int get_day_of_the_week () {
			return hdate.get_day_of_the_week ();
		}
		
		public int get_size_of_year () {
			return hdate.get_size_of_year ();
		}
		
		public int get_new_year_day_of_the_week () {
			return hdate.get_new_year_day_of_the_week ();
		}
		
		public int get_julian () {
			return hdate.get_julian ();
		}
		
		public int get_days () {
			return hdate.get_days ();
		}
		
		public int get_weeks () {
			return hdate.get_weeks ();
		}
		
		public string get_format_date (bool? diaspora = false, bool? s = false) {
			return hdate.get_format_date (diaspora, s);
		}
		
		public string get_int_string (int n) {
			return LibHdate.get_int_string (n);
		}
		
		public string get_day_string (int day, bool? s = false) {
			return LibHdate.get_day_string (day, s);
		}
		
		public string get_hebrew_month_string (int month, bool? s = false) {
			return LibHdate.get_hebrew_month_string (month, s);
		}
	
		public string get_holyday_string (int holyday, bool? s = false) {
			return LibHdate.get_holyday_string (holyday, s);
		}
	
		public string get_parasha_string (int parasha, bool? s = false) {
			return LibHdate.get_parasha_string (parasha, s);
		}
	
		public int get_size_of_hebrew_year (int hebrew_year) {
			return LibHdate.get_size_of_hebrew_year (hebrew_year);
		}
	
		public int get_holyday_type (int holyday) {
			return LibHdate.get_holyday_type (holyday);
		}
		
		public void get_utc_sun_time (int day, int month, int year, 
				double latitude, double longitude, out int sunrise, out int sunset) {
			LibHdate.get_utc_sun_time (day, month, year, 
				latitude, longitude, out sunrise, out sunset);
		}
		
		public int get_utc_sunrise (int day, int month, int year, 
				double latitude, double longitude) {
			int sunrise;
			int sunset;
			
			LibHdate.get_utc_sun_time (day, month, year, 
				latitude, longitude, out sunrise, out sunset);
				
			return sunrise;
		}
		
		public int get_utc_sunset (int day, int month, int year, 
				double latitude, double longitude) {
			int sunrise;
			int sunset;
			
			LibHdate.get_utc_sun_time (day, month, year, 
				latitude, longitude, out sunrise, out sunset);
				
			return sunset;
		}
	}
}
