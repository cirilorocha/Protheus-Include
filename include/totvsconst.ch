/*
	Header : totvsconst.ch
	Copyright (c) 2008, TOTVS SA
	All rights reserved.
*/

#ifndef _TOTVSCONST_CH_
#define _TOTVSCONST_CH_

#DEFINE DIR_DEFAULT     0         // Acesso direto pelo PATH
#DEFINE DIR_SERVER      1         // Forca acesso pelo Server
#DEFINE DIR_CLIENT      2         // Forca acesso pelo Client

#DEFINE PRT_NONE        0         //
#DEFINE PRT_CLIENT      1         // Impressao no cliente
#DEFINE PRT_SERVER      2         // Impressao no server
#DEFINE PRT_SPOOL       3         // Impressao via Spooler

//=======  DEFINES PARA FUNCAO cGetFile - INICIO =======//
#DEFINE GETF_ONLYSERVER                   0
#DEFINE GETF_OVERWRITEPROMPT              1
#DEFINE GETF_MULTISELECT                  2
#DEFINE GETF_NOCHANGEDIR                  4
#DEFINE GETF_LOCALFLOPPY                  8
#DEFINE GETF_LOCALHARD                   16
#DEFINE GETF_NETWORKDRIVE                32
#DEFINE GETF_SHAREAWARE                  64
#DEFINE GETF_RETDIRECTORY               128
//======================================================//

//=======  CONSTANTE PARA RELATORIO  =================//
#DEFINE CONST_SEMIMPRESS "Nenhuma Impressora Disponivel"
#DEFINE CONST_SEMPORTAS  "Nao existem portas disponiveis"
//======================================================//

//=======  CONSTANTES DE ALINHAMENTO DE CONTROLES ============//
#DEFINE CONTROL_ALIGN_ALLCLIENT    5
#DEFINE CONTROL_ALIGN_BOTTOM       4
#DEFINE CONTROL_ALIGN_CENTER	     6
#DEFINE CONTROL_ALIGN_LEFT         1
#DEFINE CONTROL_ALIGN_NONE         0
#DEFINE CONTROL_ALIGN_RIGHT        2
#DEFINE CONTROL_ALIGN_TOP          3
//============================================================//

//=======  CONSTANTES DE IDENTIFICAÇÃO DO TIPO DE REMOTE ============//
#DEFINE NO_REMOTE       	-1
#DEFINE REMOTE_DELPHI    	0
#DEFINE REMOTE_QT_WIN32  	1
#DEFINE REMOTE_QT_LINUX  	2
//===================================================================//

//=======  CONSTANTES DO GRAFICO ============//
#DEFINE BARCHART	00
#DEFINE LINECHART	01
#DEFINE PIECHART	02
//===========================================//

#endif