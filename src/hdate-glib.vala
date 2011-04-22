/* main.vala
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

public class Hdate : Object {
	
	public HdateC hdate;
	
	public Hdate() {
		hdate = new HdateC();
		hdate.set_gdate();
	}
}

