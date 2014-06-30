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
//  This program is free software: you can redistribute it and/or modify
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
using edwinspire.wHTML;
//using Gee;
//using edwinspire.UiWeb.Server;
//using Xml;
public class RunuSMS: GLib.Object {
	public static int main (string[] args) {
		stdout.printf ("run uHTTP!\n");
		Servidor uServer = new Servidor();
		//smsServer.ResetAndLoadDevices();
		uServer.run();
		print("El servidor muere...");
		return 0;
	}
	public class Servidor:uHttpServer {
		public override bool connection_handler_virtual(Request request, DataOutputStream dos) {
			edwinspire.uHttp.Response response = new edwinspire.uHttp.Response();
			response.Status = StatusCode.OK;
			response.Data =  "nada".data;
			//warning("*********** OJO *************\n");
			//warning(request.Path);
			switch(request.Path) {
				case  "/test.html":
				response = response_whtml(request);
				this.serve_response( response, dos );
				break;
				default:
				      response.Status = StatusCode.NOT_FOUND;
				response.Data = edwinspire.uHttp.Response.HtmErrorPage("uHTTP WebServer", "404 - Página no encontrada").data;
				response.Header["Content-Type"] = "text/html";
				break;
			}
			return false;
		}
		private edwinspire.uHttp.Response response_whtml(Request request) {
			edwinspire.uHttp.Response Retorno = new edwinspire.uHttp.Response();
			Retorno.Header["Content-Type"] = "text/html";
			Retorno.Status = StatusCode.OK;
			//warning("*********** ENTRA *************\n");
			var s = this.ReadServerFile("test.whtml");
			Widget w = new Widget();
			Retorno.Data = w.create(s).data;
			return Retorno;
		}
	}
}
