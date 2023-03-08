/*
	Header : totvswebex.ch
	Copyright (c) 2008, TOTVS SA
	All rights reserved.
*/

#ifndef _TOTVSWEBEX_CH_
#define _TOTVSWEBEX_CH_

#XCOMMAND OPEN QUERY <cQuery> ALIAS <cAlias> ;
                  [ <lNOChange: NOCHANGE> ] ;
            =>  APWExOpenQuery(<cQuery>,<cAlias>,<.lNOChange.>)

#XCOMMAND CLOSE QUERY <cAlias> => APWExCloseQuery(<cAlias>)
         
#XCOMMAND WEB EXTENDED INIT <cHtml> ;
                [ START <cFnStart> ] ;
            => If APWExInit( @<cHtml> , <cFnStart> )
            
#XCOMMAND WEB EXTENDED END ;
            => Endif

#endif

