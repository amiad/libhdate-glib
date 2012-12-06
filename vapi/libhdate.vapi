[CCode(cheader_filename = "hdate.h", lower_case_cprefix = "hdate_", cprefix = "")]
namespace LibHdate {
	[Compact]
	[CCode (cprefix = "hdate_", cname = "hdate_struct", free_function = "")]
	public class HdateC {
		[CCode (cname = "new_hdate")]
		public HdateC();
		
		public HdateC set_gdate (int? d = 0, int? m = 0, int? y = 0);
		public HdateC set_hdate (int d, int m, int y);
		public HdateC set_jd (int jd);
		
		public int get_parasha (bool diaspora);
		public int get_holyday (bool diaspora);
		public int get_omer_day();
		public int get_gday ();
		public int get_gmonth ();
		public int get_gyear ();
		public int get_hday ();
		public int get_hmonth ();
		public int get_hyear ();
		public int get_day_of_the_week ();
		public int get_size_of_year ();
		public int get_new_year_day_of_the_week ();
		public int get_julian ();
		public int get_days ();
		public int get_weeks ();
		
		public string get_format_date (bool? diaspora = false, bool? s = false);
	}
	
	[CCode (cname = "hdate_string")]
	string get_string(int type_of_string, int index, bool? s = false, bool? hebrew = false);
	
	[CCode (cname = "hdate_get_int_string")]
	string get_int_string (int n);
	
	[CCode (cname = "hdate_get_day_string")]
	string get_day_string (int day, bool? s = false);
	
	[CCode (cname = "hdate_get_hebrew_month_string")]
	string get_hebrew_month_string (int month, bool? s = false);
	
	[CCode (cname = "hdate_get_holyday_string")]
	string get_holyday_string (int holyday, bool? s = false);
	
	[CCode (cname = "hdate_get_parasha_string")]
	string get_parasha_string (int parasha, bool? s = false);
	
	[CCode (cname = "hdate_get_size_of_hebrew_year")]
	int get_size_of_hebrew_year (int hebrew_year);
	
	[CCode (cname = "hdate_get_holyday_type")]
	int get_holyday_type (int holyday);
	
	[CCode (cname = "hdate_get_utc_sun_time")]
	void get_utc_sun_time (int day, int month, int year, 
		double latitude, double longitude, out int sunrise, out int sunset);
	
	[CCode (cname = "hdate_get_utc_sun_time_full")]
	void get_utc_sun_time_full (int day, int month, int year, double latitude, double longitude, 
		out int sun_hour, out int first_light, out int talit, out int sunrise,
		out int midday, out int sunset, out int first_stars, out int three_stars);
}

