//
//
//  Author:
//       Edwin De La Cruz <admin@edwinspire.com>
//
//  Copyright (c) 2013 edwinspire
//  Web Site http://edwinspire.com
//
//  Quito - Ecuador
//
//  This program is free software: you can redistri//bute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
using GLib;
using edwinspire.uHttp;
using edwinspire.utils;


	/**
	* MultiServer run several micro HTTP servers running on different ports each.
	*/
	public class MultiServer: GLib.Object {

	public static int main (string[] args) {
		stdout.printf ("run uHTTP MultiServer!\n");
		MainLoop ml = new MainLoop();
		uHTTPMultiServer Server = new uHTTPMultiServer();
		Server.run();
		ml.run();
		return 0;
	}	
	
}

	/**
	* uHTTPMultiServer represents several micro HTTP servers running on different ports each.
	*/
	public class uHTTPMultiServer:GLib.Object{
	
		public FilesLinesArray ConfigFiles = new FilesLinesArray();
		private string AlreadyLine = "";
		public bool kill = false;
	
	/**
	* Constructor 
	* Read the configuration file from uhttpms.conf
	*/
	public uHTTPMultiServer(){
		ConfigFiles.file_name = "uhttpms.conf";
		ConfigFiles.load();
	}
	
	private void thread_servers() {
			if (!Thread.supported()) {
				stderr.printf("Cannot run without threads.\n");
			} else {
					var Cadena = new StringBuilder();
					int i = 0;
				foreach(var configfile in ConfigFiles.Lines){
					Cadena.truncate();
					Cadena.append("Load config server");
					//print("Loading the server");
					while(i<10){
						Thread.usleep(100000*1);
						Cadena.append(".");
						print("%s\n", Cadena.str);
						i++;
					}
					
					this.AlreadyLine = configfile;
				
				try {
					Thread.create<void>(this.single_server, false);
				}
				catch(ThreadError e) {
					print(e.message);
				}
					i = 0;
				}
				
			}
	}
	
	private void single_server() {	
	 	uHttpServer uServer = new uHttpServer();
	 	uServer.Config.file_name = this.AlreadyLine;
		uServer.run_without_mainloop();
		while(!kill){
			Thread.usleep(1000000*30);
		}		
	}
	
	/**
	* Run server
	*/
	public void run(){
		this.thread_servers();
	}	
	
	
	
	
	}



