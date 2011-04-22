using LibHdate;

void main () {
	HdateC h = new HdateC();
	
	h.set_gdate();
	print ("%s\n", h.get_format_date());
}
