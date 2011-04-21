[CCode(cheader_filename = "hdate.h", lower_case_cprefix = "hdate_", cprefix = "")]
namespace LibHdate {
	[Compact]
	[CCode (cprefix = "hdate_", cname = "hdate_struct", free_function = "")]
	public class HdateC {
	    public HdateC();
	    public HdateC set_gdate(int d, int m, int y);
	    public int to_jd (int day, int month, int year, out int jd_tishrey1, out int jd_tishrey1_next_year);
	}
}

