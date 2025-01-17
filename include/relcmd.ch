//Codigos utilizados no arquivo rel interpretados pela TOTVSPRINTER.EXE
#xtranslate ROW( <nRow> ) => StrZero( <nRow>, 7 )
#xtranslate COLUMN( <nColumn> ) => StrZero( <nColumn>, 5 )

#Define REL_XLSFILE   "XLS0102"

#Define REL_CMD_RESOLUTION   "0001" // N�o suportado para XLS

/**********************************************
Fonte (0002) - Mesmo comportamento (inclusive para os c�digos de barras), por�m suporta uma nova fonte: "Calibri" (c�digo 7) que funciona somente para sa�da XLS
0002	- 4 bytes   Identificador do comando
0014	- 4 bytes   Tamanho da fonte
S		- 1 byte	Negrito S ou 0
S		- 1 byte	It�lico S ou 0
S		- 1 byte	Sublinhado S ou 0
07		- 2 bytes	Identificador da fonte: 07 Calibri, exclusiva para XLS
***********************************************/
#Define REL_CMD_FONT	     "0002"

/**********************************************
Fonte (0003) - Orienta��o
0002	- 4 bytes   Identificador do comando
0014	- 2 bytes    00 - Retrato | 01 - Paisagem
***********************************************/
#Define REL_CMD_LANDSCAPE    "000301"
#Define REL_CMD_PORTRAIT     "000300"

#Define REL_CMD_PAPERSIZE    "0004"
#Define REL_CMD_CUSTOMPAPER	 "000400" // N�o suportado para XLS
#Define REL_CMD_TEXT	     "0005"   // N�o suportado para XLS

/**********************************************
Imagem (0006) - Adapta��o - Posi��o horizontal e vertical alterados para linha (7 bytes) e coluna (5 bytes)
0006	- 4 bytes	Identificador do comando.
0000001	- 7 bytes   Valor num�rico que representa a posi��o da linha (limite no Excel � 1048576)
00001	- 5 bytes   Valor num�rico que representa a posi��o da coluna (limite no Excel � 16384)
Demais bytes s�o id�nticos.
***********************************************/
#Define REL_CMD_IMAGE        "0006"
#Define REL_CMD_RECTANGLE    "0007" // N�o suportado para XLS
#Define REL_CMD_ELIPSE       "0008" // N�o suportado para XLS
#Define REL_CMD_LINE         "0009" // N�o suportado para XLS

/*******************************************
C�digo de barra vertical (0011) - Adapta��o para aceitar linha/coluna
0011	- 4 bytes   Identificador do comando
0000001	- 7 bytes   Valor num�rico que representa a posi��o da linha (limite no Excel � 1048576)
00001	- 5 bytes   Valor num�rico que representa a posi��o da coluna (limite no Excel � 16384)
Demais bytes s�o id�nticos.
***********************************************/
#Define REL_CMD_BARCODE      "0011"

#Define REL_CMD_ALIGNED_TEXT "0015" // N�o suportado para XLS

/**********************************************
Texto Excel (0025) - Novo comando
0025	- 4 bytes   Identificador do comando
0000001	- 7 bytes   Valor num�rico que representa a posi��o da linha (limite no Excel � 1048576)
00001	- 5 bytes   Valor num�rico que representa a posi��o da coluna (limite no Excel � 16384)
1		- 1 byte	Tipo de dado a ser inserido onde 0 = blank, n�mero = 1, texto = 2, f�rmula = 3, data = 4, url = 5 ou l�gico = 6
00000	- 5 bytes	Tamanho do texto a ser inserido (limite de 32767)
"texto"	- N bytes	O texto a ser inserido
***********************************************/
#Define REL_CMD_CELL_TEXT    "0025"

// Tipo de dado a ser inserido onde 0 = blank, n�mero = 1, texto = 2, f�rmula = 3, data = 4, url = 5 ou l�gico = 6
#Define CELL_TYPE_BLANK     "0"
#Define CELL_TYPE_NUMBER    "1"
#Define CELL_TYPE_TEXT      "2"
#Define CELL_TYPE_FORMULA   "3"
#Define CELL_TYPE_DATE      "4"
#Define CELL_TYPE_HYPERLINK "5"
#Define CELL_TYPE_BOOLEAN   "6"

/**********************************************
Margem (0030)
0030	- 4 bytes   Identificador do comando
0060    - 4 bytes   Margem Esquerda
0060    - 4 bytes   Margem Superior
0060    - 4 bytes   Margem Direita
0060    - 4 bytes   Margem Inferior
***********************************************/
#Define REL_CMD_MARGIN		 "0030"

// COMANDOS DO DOCUMENTO ***********************************************************************
/**********************************************
Nova P�gina (0040) - Adapta��o para 'Nova Planilha' - Permite tamb�m especificar o nome da planilha
0040	- 4 bytes	Identificador do comando.
05      - 2 bytes	Tamanho do t�tulo da planilha (limite de 31 caracteres) ou 00 para o padr�o do Excel
"Plan1"	- N bytes	O texto a ser inserido
***********************************************/
#Define REL_CMD_NEWSHEET     "0040"

/**********************************************
Formato de C�lula (0050) - Novo comando - Para efetivamente aplicar o formato � preciso inserir algum conte�do na(s) c�lula(s) atrav�s do comando 'Texto Excel' (0025)
0050	- 4 bytes   Identificador do comando
0		- 1 byte	Tipo de alinhamento horizontal onde default = 0, left = 1, center = 2, right = 3, fill = 4, justify = 5, distributed = 6
0		- 1 byte	Tipo de alinhamento vertical onde default = 0, top = 1, bottom = 2, center = 3, justify = 4, distributed = 5
0		- 1 byte	Valor l�gico que indica se a c�lula possui quebra de linha (text wrap)
000		- 3 byte	Rota��o em graus (de -90 a 90 ou 270 para texto vertical) a ser adotada pelo texto
FF0000	- 6 bytes	Cor do texto
FFFFFF	- 6 bytes	Cor de fundo
00		- 2 bytes	Tamanho do texto do formato num�rico customizado a ser inserido
"texto" - N bytes	Formato num�rico customizado (por exemplo #.##0,00)
***********************************************/
#Define REL_CMD_CELL_FORMAT  "0050"

/*******************************************
Mesclar (0051) - Novo comando - (OBS: A �ltima formata��o de c�lula � aplicada na nova c�lula mesclada)
0051	- 4 bytes   Identificador do comando
0000001	- 7 bytes   Valor num�rico que representa a linha inicial
00001	- 5 bytes   Valor num�rico que representa a coluna inicial
0000004	- 7 bytes   Valor num�rico que representa a linha final
00005	- 5 bytes   Valor num�rico que representa a coluna final
********************************************/
#Define REL_CMD_CELL_MERGE   "0051"

/*******************************************
Borda (0052) - Novo comando
0052	- 4 bytes   Identificador do comando
1   	- 1 byte    Valor l�gico que ativa a borda superior
1   	- 1 byte    Valor l�gico que ativa a borda inferior
1   	- 1 byte    Valor l�gico que ativa a borda esquerda
1   	- 1 byte    Valor l�gico que ativa a borda direita
01      - 2 bytes   Estilo da borda onde None = 0, Thin = 1, Medium = 2, Dashed = 3, Dotted = 4, Thick = 5, Double = 6, Hair = 7, Medium dashed = 8, Dash-dot = 9, Medium dash-dot = 10, Dash-dot-dot = 11, Medium dash-dot-dot = 12, Slant dash-dot = 13
000000 	- 6 bytes   Cor da borda
*******************************************/
#Define REL_CMD_CELL_BORDER  "0052"

/*******************************************
Altura de Linha (0053) - Novo comando
0053	- 4 bytes   Identificador do comando
0000001	- 7 bytes   Valor num�rico que representa a linha inicial do intervalo
0000004	- 7 bytes   Valor num�rico que representa a linha final do intervalo (para somente uma linha especificar o mesmo valor da linha inicial)
018.75	- 6 bytes   Valor decimal de 0 a 409 pontos que representa a altura da linha (o padr�o � 15)
********************************************/
#Define REL_CMD_CELL_HEIGHT  "0053"

/*******************************************
Largura de Coluna (0054) - Novo comando
0054	- 4 bytes   Identificador do comando
00005	- 5 bytes   Valor num�rico que representa a coluna inicial do intervalo
00010	- 5 bytes   Valor num�rico que representa a coluna final do intervalo (para somente uma coluna especificar o mesmo valor da coluna inicial)
023.71 	- 6 bytes   Valor decimal de 0 a 255 que representa a largura da coluna (o padr�o � 8,43)
********************************************/
#Define REL_CMD_CELL_WIDTH   "0054"

/*******************************************
AutoFiltro (0055) - Novo comando
0055	- 4 bytes   Identificador do comando
0000001	- 7 bytes   Valor num�rico que representa a linha inicial do intervalo
00001	- 5 bytes   Valor num�rico que representa a coluna inicial do intervalo
0000007	- 7 bytes   Valor num�rico que representa a linha final do intervalo
00003	- 5 bytes   Valor num�rico que representa a coluna final do intervalo
********************************************/
#Define REL_CMD_AUTOFILTER   "0055"

