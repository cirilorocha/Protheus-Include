/*
	Header : totvsmail.ch
	Copyright (c) 2008, TOTVS SA
	All rights reserved.
*/

#ifndef _TOTVSMAIL_CH_
#define _TOTVSMAIL_CH_

#xcommand CONNECT SMTP SERVER <cServer>										;
					ACCOUNT <cUser>											;
					PASSWORD <cPass>										;
					[ TIMEOUT <nTimeOut> ]									;
					[ IN <lRemote: SERVER> <oRpcSrv> ]	  					;
					[ RESULT <lResult> ]									;
					[ <lUseTLSMail:TLS> ] ;
			=>	;													 
					If ( <.lRemote.> )										; ;
						[<lResult>:=][<oRpcSrv>:]CallProc( 'MailSmtpOn', <cServer>, <cUser>, <cPass>, <nTimeOut>, [<.lUseTLSMail.>] ) ; ;
					Else													; ;
						[<lResult>:=]MailSmtpOn( <cServer>, <cUser>, <cPass>, <nTimeOut>, [<.lUseTLSMail.>] ) 				; ;
					EndIf													; ;

#xcommand CONNECT POP SERVER <cServer>										;
					ACCOUNT <cUser>											;
					PASSWORD <cPass>										;
					[ TIMEOUT <nTimeOut> ]									;
					[ IN <lRemote: SERVER> <oRpcSrv> ]	  					;
					[ RESULT <lResult> ]									;
					[ <lUseTLSMail:TLS> ] ;
			=>	;													 
					If ( <.lRemote.> )										; ;
						[<lResult>:=][<oRpcSrv>:]CallProc( 'MailPopOn', <cServer>, <cUser>, <cPass>, <nTimeOut>, [<.lUseTLSMail.>] ) ; ;
					Else													; ;
						[<lResult>:=]MailPopOn( <cServer>, <cUser>, <cPass>, <nTimeOut>, [<.lUseTLSMail.>] ) ; ;
					EndIf													; ;

#xcommand DISCONNECT SMTP SERVER ;
					[ IN <lRemote: SERVER> <oRpcSrv> ]	  					;
					[ RESULT <lResult> ]									;					
			=>	;													 
					If ( <.lRemote.> )										; ;
						[<lResult>:=][<oRpcSrv>:]CallProc( 'MailSmtpOff' ) 	; ;
					Else													; ;
						[<lResult>:=]MailSmtpOff() 						; ;
					EndIf													; ;

#xcommand DISCONNECT POP SERVER ;
					[ IN <lRemote: SERVER> <oRpcSrv> ]	  					;
					[ RESULT <lResult> ]									;					
			=>	;													 
					If ( <.lRemote.> )										; ;
						[<lResult>:=][<oRpcSrv>:]CallProc( 'MailPopOff' ) 	; ;
					Else													; ;
						[<lResult>:=]MailPopOff() 						; ;
					EndIf													; ;

#xcommand POP MESSAGE COUNT <nMsgCount>;
					[ IN <lRemote: SERVER> <oRpcSrv> ];
					[ RESULT <lResult> ];
			=>	;
					If ( <.lRemote.> );;
						_aRet := [<oRpcSrv>:]CallProc( '_PopMsgCount');;
						<nMsgCount> := _aRet\[1\];;
						[ <lResult> := ]_aRet\[2\];;
					Else;;
						[ <lResult>:= ]PopMsgCount(@<nMsgCount>);;
					EndIf;;

#xcommand SEND MAIL FROM <cFrom>											;
					TO	<aTo,...>											;
					[ CC <aCc,...> ]   										;
					[ BCC <aBcc,...> ]										;
					SUBJECT <cSubject>										;
					BODY <cBody>											;
					[ FORMAT <lText: TEXT> ]								;
					[ ATTACHMENT <aFiles,...> ]								;
					[ IN <lRemote: SERVER> <oRpcSrv> ]	  					;
					[ RESULT <lResult> ]									;
					[ <lUseTLSMail:TLS> ] ;
			=>	;													 
					If ( <.lRemote.> )										; ;
						[<lResult>:=][<oRpcSrv>:]CallProc( 'MailSend', <cFrom>, \{ <aTo> \}, \{ <aCc> \}, \{ <aBcc> \}, <cSubject>, <cBody>, \{ <aFiles> \}, <.lText.>, [<.lUseTLSMail.>] ) ; ;
					Else													; ;
						[<lResult>:=]MailSend( <cFrom>, \{ <aTo> \}, \{ <aCc> \}, \{ <aBcc> \}, <cSubject>, <cBody>, \{ <aFiles> \}, <.lText.>, [<.lUseTLSMail.>] ) ; ;
					EndIf													; ;
					
#xcommand GET MAIL ERROR <cErrorMsg> 										;
					[ IN <lRemote: SERVER> <oRpcSrv> ]	  					;
			=>	;													 
					If ( <.lRemote.> )										; ;
						<cErrorMsg>:=[<oRpcSrv>:]CallProc( 'MailGetErr' ) 	; ;
					Else													; ;
						<cErrorMsg>:=MailGetErr( )          				; ;
					EndIf													; ;

#xcommand RECEIVE MAIL MESSAGE <nNumber> ;
					[FROM <cFrom>]											;
					[TO	<cTo>]											;
					[CC <cCc>]    										;
					[BCC <cBcc>] 										;
					[SUBJECT <cSubject>]										;
					[BODY <cBody>]											;
					[ATTACHMENT <aFiles> [SAVE IN <cPath>] ]				;
					[<lDelete: DELETE>] ;
					[IN <lRemote: SERVER> <oRpcSrv> ]	  					;
					[RESULT <lResult> ]									;
					[<lUseTLSMail:TLS> ] ;
			=>	;													 
				If ( <.lRemote.> )										; ;
					_aResult := [<oRpcSrv>:]CallProc('_MailReceive', <nNumber>,  [<cPath>], [<.lDelete.>], [<.lUseTLSMail.>] ) ; ;
					[<cFrom> :=] _aResult\[1\];;
					[<cTo> :=] _aResult\[2\];;
					[<cCc> :=] _aResult\[3\];;
					[<cBcc> :=] _aResult\[4\];;
					[<cSubject>] := _aResult\[5\];;
					[<cBody> :=] _aResult\[6\];;
					[<aFiles> :=] aClone(_aResult\[7\]);;
					[<lResult>:=] _aResult\[8\];;
				Else													; ;
					[<lResult>:=]MailReceive(<nNumber>, [@<cFrom>], [@<cTo>], [@<cCc>], [@<cBcc>], [@<cSubject>], [@<cBody>], [<aFiles>], [<cPath>], [<.lDelete.>], [<.lUseTLSMail.>] ) ; ;
				EndIf ; ;

#endif
