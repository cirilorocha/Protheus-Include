//-------------------------------------------------------------------
// Assinatura sera utilizada para n�o permitir a altera��o 
// das SetKeys utilizadas na Acessibilidade Visual
//-------------------------------------------------------------------
#DEFINE SET_KEY_SIGNATURE "ONLY_ACC_VISUAL" 
//-------------------------------------------------------------------
// Tipos de Sintetizador
//-------------------------------------------------------------------
#DEFINE TTS_PHYSICAL   	0 // Acessibilidade Motora (Utiliza artificios da Visual)
#DEFINE TTS_SAPI5   	1 // Solu��o FrameWork
#DEFINE TTS_SAPI4   	2 // Solu��o TOTVSTec
#DEFINE TTS_VVISION 	3 // Solu��o Virtual Vision (Bin�rio)
//-------------------------------------------------------------------
// A��es do sintetizador
//-------------------------------------------------------------------
#DEFINE AV_OPENVOICE   	1
#DEFINE AV_SPEAK       	2
#DEFINE AV_CLOSEVOICE  	3
#DEFINE AV_SETRATE     	4
#DEFINE AV_SETVOLUME   	5
#DEFINE AV_SPEAKWAIT   	6
//-------------------------------------------------------------------
// Defini��es do Profile do Configurador de Voz
//-------------------------------------------------------------------
#DEFINE SPK_RATE 		"SPK_RATE"  
#DEFINE SPK_VOLUME 		"SPK_VOLUME"
//-------------------------------------------------------------------
// Chaves do SetKey da Acessibilidade Visual
//-------------------------------------------------------------------
#DEFINE KEY_HELP				K_CTRL_F1
#DEFINE KEY_INFO_FIELD			K_CTRL_F2
#DEFINE KEY_CANCEL 				K_CTRL_F3
#DEFINE KEY_FORM_MAP			K_CTRL_F4
#DEFINE KEY_SPECIAL_KEYS		K_CTRL_F5
#DEFINE KEY_BAR_OPTIONS			K_CTRL_F6
#DEFINE KEY_CONFIG     			K_CTRL_F7
#DEFINE KEY_GLOBAL_SHORTCUTS	K_CTRL_F12
#DEFINE KEY_AVMENU_EXECUTE		K_CTRL_E