/*===================================================*/
/* COMPANY NAME: HPA SYSTEMS                         */
/*===================================================*/
/* Application......: MESSAGE BOARD                  */
/*                                                   */
/* Module Name......:                                */
/* Program Name.....: MESSAGE BOARD MAINTENANCE      */
/* Program Description: MESSAGE BOARD MAINTENANCE    */
/*                      CL DRIVER                    */
/*                                                   */
/* Documentation....:                                */
/* Called By........:                                */
/* Sequence.........:                                */
/* Programs Called..:                                */
/*                                                   */
/* Create Options...:  *USRPRF(USER)                 */
/* Object Owner.....:  QPGMR                         */
/* Created By.......:  RICHARD KNECHTEL              */
/* Creation Date....:  12/01/2001                    */
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
START:       PGM

             DCL        VAR(&BEENHERE) TYPE(*CHAR) LEN(100)
             DCL        VAR(&MSG) TYPE(*CHAR) LEN(80)
             DCL        VAR(&USER) TYPE(*CHAR) LEN(10)


/* GLOBAL ERROR CHECKING */
ERRCHK:
             MONMSG     MSGID(CPF0000)                              +
                        EXEC(GOTO CMDLBL(ERROR))
             RCVMSG     MSGTYPE(*LAST) MSG(&MSG)


/* &BEENHERE VARIABLE FOR DEBUGGIN PURPOSES */
             CHGVAR     VAR(&BEENHERE) VALUE('PROGRAM MSGBRDMC IS NOW    +
                        EXECUTING')

/* MAIN PROGRAM GOES HERE */

             RTVJOBA    USER(&USER)
             MONMSG     MSGID(CPF0000 CPF9999)


/*********************************************************************/
/* CALL PROCESSING PROGRAM                                           */
/*********************************************************************/
             CALL       PGM(MSGBRDMR) PARM(&USER)


/* BELOW IS MAINLINE MONMSG COMMAND TO USE AFTER COMMANDS */
             MONMSG     MSGID(CPF0000) EXEC(DO)
                        GOTO CMDLBL(ERROR)
                        ENDDO

             GOTO      CMDLBL(ENDPGM)

/* END PART OF GLOBAL ERROR CHECKING ROUTINE */
ERROR:
             RCVMSG     MSGTYPE(*LAST) MSG(&MSG)
             MONMSG     MSGID(CPF0000)
             SNDPGMMSG  MSG(&MSG)
             MONMSG     MSGID(CPF0000)

ENDPGM:      ENDPGM
