      *****************************************************************
      ** COMPANY NAME: HPA SYSTEMS
      *****************************************************************
      ** Application......:  MESSAGE BOARD
      **
      ** Program..........:  MESSAGE BOARD MAINTENANCE
      **
      ** Documentation....:
      ** CREATED By.......:  RICHARD KNECHTEL
      ** Creation Date....:  12/01/2001
      **
      **
      *****************************************************************
      *  MODIFICATION LOG:                                            *
      *===============================================================*
      *##|WHO        |WHEN      |WHAT & (CSR#)                        *
      *===============================================================*
      *  |           |          |                                     *
      *  |           |          |                                     *
      *---------------------------------------------------------------*
      *****************************************************************
      *********  LICENSE  ************************************
      *                                                      *
      * This program is free software; you can redistribute  *
      * it and/or modify it under the terms of the GNU       *
      * General Public License as published by  the Free     *
      * Software Foundation; either version 2 of the License,*
      * or (at your option) any later version.               *
      *                                                      *
      * This program is distributed in the hope that it will *
      * be useful, but WITHOUT ANY WARRANTY; without even    *
      * the implied warranty of MERCHANTABILITY or FITNESS   *
      * FOR A PARTICULAR PURPOSE.  See the GNU General       *
      * Public License for more details.                     *
      *                                                      *
      * You should have received a copy of the GNU General   *
      * Public License along with this program; if not,      *
      * write to the                                         *
      * Free Software                                        *
      * Foundation, Inc., 675 Mass Ave,                      *
      * Cambridge, MA 02139, USA.                            *
      *                                                      *
      ********************************************************
      **
     A                                      DSPSIZ(24 80 *DS3)
     A                                      PRINT
     A                                      ALTPAGEDWN(CF07)
     A                                      CA03(03 'EXIT')
     A                                      CF04(90 'DISPLAY/CODES')
     A                                      CF06(06 'ADD RECORD')
     A                                      CA12(12 'Previous')
     A                                      CF14(14 'Add/Update')
      ****************************************************************
     A          R SFL1                      SFL
     A* 40                                  SFLNXTCHG
     A                                      CHGINPDFT
      *A            SFLPS          4S 0H      SFLRCDNBR(CURSOR)
     A            TIME           6S 0H
     A            SELIO          1S 0I  8 10
     A                                      VALUES(2 4)
     A N09                                  DSPATR(UL)
     A  09                                  DSPATR(PR)
     A                                      DSPATR(RI)
     A            FDATE          8  0O  8 15
     A                                      EDTWRD('  /  /    ')
     A                                      COLOR(TRQ)
     A            TDATE          8  0O  8 28
     A                                      EDTWRD('  /  /    ')
     A                                      COLOR(TRQ)
     A            TUSR          10A  O  8 42
     A                                      COLOR(TRQ)
     A            FUSR          10A  O  8 57
     A                                      COLOR(TRQ)
     A            MSGNM          4  0O  8 72
     A                                      COLOR(TRQ)
      **************************************************************
     A          R SFL1CTL                   SFLCTL(SFL1)
     A                                      BLINK
     A                                      OVERLAY
     A  40                                  SFLCLR
     A                                      SFLDSPCTL
     A  42                                  SFLDSP
     A  99                                  SFLEND(*MORE)
     A                                      SFLSIZ(13)
     A                                      SFLPAG(12)
     A  60                                  SFLMSG('Roll up or down beyond firs-
     A                                      t or last record in subfile.' 60)
     A            SFLPS          4S 0H      SFLRCDNBR(CURSOR)
     A*           SFLPS          4S 0H      SFLRCDNBR
     A                                  1  3'Date:'
     A                                      COLOR(BLU)
     A                                  1  9DATE
     A                                      EDTCDE(Y)
     A                                      COLOR(BLU)
     A                                  1 25'Message Board Maintenance'
     A                                      COLOR(BLU)
     A                                  1 67USER
     A                                      COLOR(BLU)
     A                                  2  5TIME
     A                                      COLOR(BLU)
     A                                  4  3'Type an action codes.  Then Enter.'
     A                                      COLOR(WHT)
     A                                  5  6'2=Update'
     A                                      COLOR(WHT)
     A                                  5 16'4=Delete'
     A                                      COLOR(WHT)
     A                                  7  8'Actn   From/Date    To/Date       -
     A                                      To/User        From/User      MsgNu-
     A                                      m'
     A                                      COLOR(WHT)
     A                                      DSPATR(RI)
      *************************************************************************
      ** ADD/UPDATE SCREEN
     A          R SCREEN2
     A                                      BLINK
     A                                      OVERLAY
     A                                  1  3'Date:'
     A                                      COLOR(BLU)
     A                                  1  9DATE
     A                                      EDTCDE(Y)
     A                                      COLOR(BLU)
     A                                  1 26'Message Board Maintenance'
     A                                      COLOR(BLU)
     A                                  1 67USER
     A                                      COLOR(BLU)
     A                                  2  5TIME
     A                                      COLOR(BLU)
     A                                  3 14'From/Date (MM/DD/YYYY)'
     A                                      COLOR(WHT)
     A            FRMDAT         8  0B  3 37
     A                                      EDTWRD('  /  /    ')
     A                                      COLOR(BLU)
     A                                  3 48'To/Date (MM/DD/YYYY)'
     A                                      COLOR(WHT)
     A            TODAT          8  0B  3 69
     A                                      EDTWRD('  /  /    ')
     A                                      COLOR(BLU)
     A                                  5 18'Send to a specific user'
     A                                      COLOR(WHT)
     A            TOUSER        10A  B  5 44
     A                                      COLOR(BLU)
     A                                  7  1'Message Text                      -
     A                                                                         -
     A                                               '
     A                                      COLOR(WHT)
     A                                      DSPATR(RI)
     A            MESSAG      1200A  B  8  1
     A                                      COLOR(BLU)
     A                                      CHECK(LC)
     A                                 23  2'F12=Previous  F14=Add/Update'
     A                                      COLOR(BLU)
     A  66        ERRMSG        77A  O 24  2
     A  66                                  COLOR(RED)
      ** FUNCTION KEYS  *************************************************
     A          R FKEYS                     OVERLAY
     A                                 23  2'Enter   F3=Exit   F6=Create '
     A                                      COLOR(BLU)
      ** BLANK RECORD FORMAT *******************************************
     A          R EMPTY
      ****************************************************************
