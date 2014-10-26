#!/bin/bash
valac  -d "/home/edwinspire/Documentos/DesarrolloSoftware/ProyectosSoftware_ng/proyects/uhttp/bin/lnx"  "/home/edwinspire/Documentos/DesarrolloSoftware/ProyectosSoftware_ng/proyects/uhttp/uhttp_main.vala"  --pkg gee-1.0  --pkg gio-2.0  -X "-L/home/edwinspire/Documentos/DesarrolloSoftware/ProyectosSoftware_ng/proyectlibs/lnx"  -X "-I/home/edwinspire/Documentos/DesarrolloSoftware/ProyectosSoftware_ng/proyectlibs/lnx"  "/home/edwinspire/Documentos/DesarrolloSoftware/ProyectosSoftware_ng/proyectlibs/lnx/libspire_uhttp.vapi" -X -lspire_uhttp  "/home/edwinspire/Documentos/DesarrolloSoftware/ProyectosSoftware_ng/proyectlibs/lnx/libspire_utilities.vapi" -X -lspire_utilities  -o uhttp  --thread   


echo "Generando documentacion"
valadoc  --vapidir="/home/edwinspire/Documentos/DesarrolloSoftware/ProyectosSoftware_ng/vapi_intern/"  --vapidir="/home/edwinspire/Documentos/DesarrolloSoftware/ProyectosSoftware_ng/proyectlibs/lnx"  "/home/edwinspire/Documentos/DesarrolloSoftware/ProyectosSoftware_ng/proyects/uhttp/uhttp_main.vala"  --pkg gee-1.0  --pkg gio-2.0  --pkg libspire_uhttp  --pkg libspire_utilities  --basedir="/" --force -o "/home/edwinspire/Documentos/DesarrolloSoftware/ProyectosSoftware_ng/proyects/uhttp/documentation/uhttp"

read
