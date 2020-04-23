/*===================================================*/
/* COMPANY NAME: HPA SYSTEMS                         */
/*===================================================*/
/* Application......: CRTUSR                         */
/*                                                   */
/* Module Name......:                                */
/* Program Name.....: CRTUSR                         */
/* Program Description: CREATE USER: THIS PROGRAM    */
/*                      WILL CREATE A USER PROFILE,  */
/*                      THEIR LIBRARY AND SOURCE     */
/*                      FILES IF NEEDED.             */
/*                                                   */
/* Documentation....: RICHARD KNECHTEL               */
/* Called By........:                                */
/* Sequence.........:                                */
/* Programs Called..:                                */
/*                                                   */
/* Create Options...:  *USRPRF(USER)                 */
/* Object Owner.....:  QPGMR                         */
/* Created By.......:  RICHARD KNECHTEL              */
/* Creation Date....:  3/15/1999                     */
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
/*****************************************************/
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
             DCL        VAR(&NEWUSR) TYPE(*CHAR) LEN(8)
             DCL        VAR(&FNAME) TYPE(*CHAR) LEN(10)
             DCL        VAR(&LNAME) TYPE(*CHAR) LEN(15)
             DCL        VAR(&FI) TYPE(*CHAR) LEN(1)
             DCL        VAR(&ERROR) TYPE(*CHAR) LEN(70)
             DCL        VAR(&TEXT) TYPE(*CHAR) LEN(50)
             DCL        VAR(&NUM) TYPE(*DEC) LEN(1 0)
             DCL        VAR(&NUMC) TYPE(*CHAR) LEN(1)
             DCL        VAR(&LIB) TYPE(*CHAR) LEN(10)
             DCL        VAR(&USRTYP) TYPE(*CHAR) LEN(1)
/* Change the system name VALUE to your system name */
             DCL        VAR(&SYSTEM) TYPE(*CHAR) LEN(8) VALUE(MYSYSTEM)

    /* VALID CODES FOR &USRTYP: 1 = User Type 1 */
    /*                          2 = User Type 2    */
             DCLF       FILE(CRTUSRD)

/* GLOBAL ERROR CHECKING */
ERRCHK:
             MONMSG     MSGID(CPF0000 MCH0000)                              +
                        EXEC(GOTO CMDLBL(ERROR))
             RCVMSG     MSGTYPE(*LAST) MSG(&MSG)


/* &BEENHERE VARIABLE FOR DEBUGGING PURPOSES */
             CHGVAR     VAR(&BEENHERE) VALUE('PROGRAM CRTUSR IS NOW   +
                        EXECUTING')

/* MAIN PROGRAM GOES HERE */
/* BELOW IS MIANLINE MONMSG COMMAND TO USE AFTER COMMANDS */
             MONMSG     MSGID(CPF0000) EXEC(GOTO CMDLBL(ERROR))

/* RECIEVE USER INPUT FROM SCREEN FOR: */
/* USER PROFILE,FIRST/LAST NAME, USER TYPE */
DISPLAY:     SNDRCVF    RCDFMT(SCREEN1)

    /* IF USER PRESSES F3 TO EXIT */
             IF  COND(&IN03 *EQ '1') THEN(DO)
                 GOTO CMDLBL(ENDPGM)
                 ENDDO
                 ELSE (DO)
/* IF THE USER PROFILE, FIRST/LAST NAME AND USER TYPE FIELDS ARE */
/* NOT BLANK CONTINUE */
                 IF  COND((&FNAME *NE ' ') *AND (&LNAME *NE ' ') +
                          *AND (&USRTYP *NE ' ')) THEN(GOTO CMDLBL(DOIT))
/* IF NOT ALL FILEDS WERE POPULATED ON SCREEN*/
                 ELSE       GOTO CMDLBL(DISPLAY)

DOIT:
/* STEPS: 1)CREATE USER PROFILE 2)CREATE LIBRARY 3)CREATE OUTQ */
/*        4)CREATE SOURCE FILES(IF NEEDED)                     */

CRTUSRPF:
/* CREATE USER PROFILES */
             CHGVAR     VAR(&TEXT) VALUE(&FNAME *BCAT &LNAME)

/* MAKE SURE FIRST POSITION OF FIRST NAME IS NOT A BLANK */
             CHGVAR     VAR(&FI) VALUE(%SST(&FNAME 1 1))
             IF         COND(&FI *EQ ' ') THEN(DO)
                        CHGVAR VAR(&ERROR) VALUE('First position  +
                               of Name cannot be blank')
                        GOTO CMDLBL(DISPLAY)
                        ENDDO

/* MAKE SURE FIRST POSITION OF LAST NAME IS NOT A BLANK */
             CHGVAR     VAR(&FI) VALUE(%SST(&LNAME 1 1))
             IF         COND(&FI *EQ ' ') THEN(DO)
                        CHGVAR VAR(&ERROR) VALUE('First position  +
                               of Name cannot be blank')
                        GOTO CMDLBL(DISPLAY)
                        ENDDO

/* ALL IS OK */
             IF         COND(&ERROR *NE ' ') THEN(DO)
                        CHGVAR     VAR(&ERROR) VALUE(' ')
                        SNDRCVF    RCDFMT(SCREEN1)
                        ENDDO
             CHGVAR     VAR(&NEWUSR) VALUE(%SST(&FNAME 1 1) *TCAT +
                          %SST(&LNAME 1 7))


 /* CONSULTANT */
                   IF         COND(&USRTYP *EQ '1') THEN(DO)
 USRC:       CRTUSRPRF  USRPRF(&NEWUSR) PASSWORD(&NEWUSR) +
                          PWDEXP(*YES) USRCLS(*PGMR) INLPGM(*NONE) +
                          TEXT(&TEXT) SPCAUT(*JOBCTL *SPLCTL) +
                          OUTQ(&NEWUSR/&NEWUSR)
             MONMSG     MSGID(CPF2214) EXEC(DO)
                              CHGVAR VAR(&NUM) VALUE(&NUM + 1)
                              CHGVAR VAR(&NUMC) VALUE(&NUM)
                        CHGVAR     VAR(&NEWUSR) VALUE(%SST(&NEWUSR 1 7) +
                                     *TCAT &NUMC)
                                   GOTO CMDLBL(USRC)
                        ENDDO
                   ENDDO
/* MANAGER */
                   ELSE      IF         COND(&USRTYP *EQ '2') THEN(DO)
 USRM:       CRTUSRPRF  USRPRF(&NEWUSR) PASSWORD(&NEWUSR) +
                          PWDEXP(*YES) USRCLS(*SECADM) +
                          INLPGM(*NONE) TEXT(&TEXT) SPCAUT(*JOBCTL +
                          *AUDIT *JOBCTL *SAVSYS *SECADM *SPLCTL) +
                          OUTQ(&NEWUSR/&NEWUSR)
             MONMSG     MSGID(CPF2214) EXEC(DO)
                              CHGVAR VAR(&NUM) VALUE(&NUM + 1)
                              CHGVAR VAR(&NUMC) VALUE(&NUM)
                        CHGVAR     VAR(&NEWUSR) VALUE(%SST(&NEWUSR 1 7) +
                                     *TCAT &NUMC)
                                   GOTO CMDLBL(USRM)
                        ENDDO
                   ENDDO
CRTLIB:
/* CREATE USER LIBRARY */
             CHGVAR     VAR(&TEXT) VALUE(&FNAME *BCAT ' ' *CAT &LNAME +
                          *BCAT ' ' *CAT 'LIBRARY')
                   CRTLIB     LIB(&NEWUSR) TEXT(&TEXT)
                   MONMSG     MSGID(CPF0000) EXEC(GOTO CMDLBL(ERROR))

CRTOUTQ:
/* CREATE USER OUTPUT QUEUE */
                   CRTOUTQ    OUTQ(&NEWUSR/&NEWUSR)
                   MONMSG     MSGID(CPF0000) EXEC(GOTO CMDLBL(ERROR))

CRTSRCF:
/* CREATE SOURCE FILES */
             CHGVAR VAR(&LIB) VALUE(&NEWUSR)

             CRTSRCPF   FILE(&LIB/QCLSRC) TEXT('Source file for CL +
                          Programs')

             CRTSRCPF   FILE(&LIB/QCSRC) TEXT('Source file for C +
                          Programs')

             CRTSRCPF   FILE(&LIB/QRPGSRC) TEXT('Source file for RPG +
                          Programs')

             CRTSRCPF FILE(&LIB/QRPGLESRC) RCDLEN(112) TEXT('Source +
                          file for RPG IV / ILE Programs')

             CRTSRCPF   FILE(&LIB/QDDSSRC) TEXT('Source file for +
                          Data Desc. Specs.')

             CRTSRCPF   FILE(&LIB/QCMDSRC) TEXT('Source file for +
                          Commands')

             CRTSRCPF   FILE(&LIB/QLBLSRC) TEXT('Source file for +
                          COBOL Programs')

             CRTSRCPF   FILE(&LIB/QMENUSRC) TEXT('Source file for +
                          Menus')

             CRTSRCPF   FILE(&LIB/QTXTSRC) TEXT('Source file for +
                          Text')

             CHGLIBOWN  LIB(&NEWUSR) NEWOWN(&NEWUSR)

 ADDDIRE:    ADDDIRE    USRID(&NEWUSR &SYSTEM) USRD(&FNAME *BCAT +
                          &LNAME) USER(&NEWUSR) LSTNAM(&LNAME) +
                          FSTNAM(&FNAME)

 CRTFLR:     CRTFLR     FLR(&NEWUSR) INFLR('USERS') TEXT('&FNAME +
                          *BCAT &LNAME')

             ENDDO /* MATCH FOR DO IN F12 CHECK */

CREATED:     CHGVAR     VAR(&ERROR) VALUE('USER PROFILE' *BCAT &NEWUSR *BCAT +
                                      'WAS CREATED FOR' *BCAT &FNAME *BCAT +
                                      &LNAME)
             CHGVAR     VAR(&FNAME) VALUE(' ')
             CHGVAR     VAR(&LNAME) VALUE(' ')
             CHGVAR     VAR(&USRTYP) VALUE(' ')

/* STAY IN PROGRAM UNTIL F3 IS PRESSED */
             GOTO      CMDLBL(DISPLAY)

/* END PART OF GLOBAL ERROR CHECKING ROUTINE */
ERROR:
             RCVMSG     MSGTYPE(*LAST) MSG(&MSG)
             MONMSG     MSGID(CPF0000)
             SNDPGMMSG  MSG(&MSG) TOMSGQ(*LIBL/QSYSOPR) MSGTYPE(*INFO)
             MONMSG     MSGID(CPF0000)
             DSPJOBLOG  OUTPUT(*PRINT) /* SPOOL JOBLOG */
             MONMSG     MSGID(CPF0000)

ENDPGM:      ENDPGM
