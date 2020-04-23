/*===================================================*/
/* COMPANY NAME:  HPA SYSTEMS                        */
/*===================================================*/
/* Application......: CONVERT COMMA DELIMITED FILE   */
/*                                                   */
/* Module Name......:                                */
/* Program Name.....: CVTDELIMC                      */
/* Program Description: CONVERT COMMA DELIMITED      */
/*                      FILES TO AN AS/400 DB        */
/*                                                   */
/* Documentation....:                                */
/* Called By........:                                */
/* Sequence.........:                                */
/* Programs Called..:                                */
/*                                                   */
/* Create Options...:  *USRPRF(USER)                 */
/* Object Owner.....:  QPGMR                         */
/* Created By.......:  RICHARD KNECHTEL              */
/* Creation Date....:  12/28/2001                    */
/*                                                   */
/* NOTE: ANY DELIMITED FILES SENT UP -MUST- HAVE A   */
/*       TRAILING COMMA ON EACH RECORD!!!!!          */
/*                                                   */
/* Modifications....:                                */
/*---------------------------------------------------*/
/* ## | DATE     | WHO        | NOTES                */
/* ------------------------------------------------- */
/*    |          |            |                      */
/*    |          |            |                      */
/*---------------------------------------------------*/
/*    |          |            |                      */
/*    |          |            |                      */
/*===================================================*/
/*********  LICENSE  ************************************/
/*                                                      */
/* This program is free software; you can redistribute  */
/* it and/or modify it under the terms of the GNU       */
/* General Public License as published by  the Free     */
/* Software Foundation; either version 2 of the License,*/
/* or (at your option) any later version.               */
/*                                                      */
/* This program is distributed in the hope that it will */
/* be useful, but WITHOUT ANY WARRANTY; without even    */
/* the implied warranty of MERCHANTABILITY or FITNESS   */
/* FOR A PARTICULAR PURPOSE.  See the GNU General       */
/* Public License for more details.                     */
/*                                                      */
/* You should have received a copy of the GNU General   */
/* Public License along with this program; if not,      */
/* write to the                                         */
/* Free Software                                        */
/* Foundation, Inc., 675 Mass Ave,                      */
/* Cambridge, MA 02139, USA.                            */
/*                                                      */
/********************************************************/

/* START OF PROGRAM - DECLARATIONS AND SUCH */
START:       PGM PARM(&FILE1 &FILE2)

             DCL        VAR(&BEENHERE) TYPE(*CHAR) LEN(100)
             DCL        VAR(&MSG) TYPE(*CHAR) LEN(80)
             DCL        VAR(&FILE1) TYPE(*CHAR) LEN(20)
             DCL        VAR(&FILE2) TYPE(*CHAR) LEN(20)
             DCL        VAR(&FILEIN) TYPE(*CHAR) LEN(10)
             DCL        VAR(&LIBRARY1) TYPE(*CHAR) LEN(10)
             DCL        VAR(&FILEOUT) TYPE(*CHAR) LEN(10)
             DCL        VAR(&LIBRARY2) TYPE(*CHAR) LEN(10)

/* GLOBAL ERROR CHECKING */
ERRCHK:
             MONMSG     MSGID(CPF0000 MCH0000)                              +
                        EXEC(GOTO CMDLBL(ERROR))
             RCVMSG     MSGTYPE(*LAST) MSG(&MSG)


/* &BEENHERE VARIABLE FOR DEBUGGING PURPOSES */
             CHGVAR     VAR(&BEENHERE) VALUE('PROGRAM CVTDELIMC IS NOW    +
                        EXECUTING')

             CHGVAR     VAR(&FILEIN) VALUE(%SST(&FILE1 1 10))
             CHGVAR     VAR(&LIBRARY1) VALUE(%SST(&FILE1 11 10))
             CHGVAR     VAR(&FILEOUT) VALUE(%SST(&FILE2 1 10))
             CHGVAR     VAR(&LIBRARY2) VALUE(%SST(&FILE2 11 10))

             OVRDBF     FILE(INPUTPF) TOFILE(&LIBRARY1/&FILEIN) +
                          MBR(*FIRST) SEQONLY(*YES)
             MONMSG     MSGID(CPF0000) EXEC(GOTO CMDLBL(ERROR))

             OVRDBF     FILE(OUTPUTPF) TOFILE(&LIBRARY2/&FILEOUT) +
                          MBR(*FIRST) SEQONLY(*YES)
             MONMSG     MSGID(CPF0000) EXEC(GOTO CMDLBL(ERROR))

             CALL       PGM(CVTDELIMR)
             MONMSG     MSGID(CPF0000) EXEC(GOTO CMDLBL(ERROR))

             DLTOVR     FILE(*ALL)
             MONMSG     MSGID(CPF0000) EXEC(GOTO CMDLBL(ERROR))

             GOTO       CMDLBL(ENDPGM)

/* END PART OF GLOBAL ERROR CHECKING ROUTINE */
ERROR:
             RCVMSG     MSGTYPE(*LAST) MSG(&MSG)
             MONMSG     MSGID(CPF0000)
             SNDPGMMSG  MSG(&MSG) TOMSGQ(*LIBL/QSYSOPR) MSGTYPE(*INFO)
             MONMSG     MSGID(CPF0000)
/**          DSPJOBLOG  OUTPUT(*PRINT) */   /* SPOOL JOBLOG */
/**          MONMSG     MSGID(CPF0000) */

ENDPGM:      ENDPGM
