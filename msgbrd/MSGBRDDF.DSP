      *****************************************************************
      ** COMPANY NAME:
      *****************************************************************
      ** Application......: MESSAGE BOARD
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
     A                                      CA03(03 'Quit')
     A                                      CA04(04 'Delete')
     A                                      PAGEDOWN(07 'ROLLDOWN')
     A                                      PAGEUP(08 'ROLLUP')
     A          R MESG1
     A                                  1  2'Date:'
     A                                      COLOR(BLU)
     A                                  1  8DATE
     A                                      EDTCDE(Y)
     A                                      COLOR(BLU)
     A                                  1 19'MESSAGE!   MESSAGE!   MESSAGE!  ME-
     A                                      SSAGE!'
     A                                      COLOR(RED)
     A                                  1 67'Time:'
     A                                      COLOR(BLU)
     A                                  1 73TIME
     A                                      COLOR(BLU)
     A                                  3  2'From.'
     A                                      COLOR(BLU)
     A            FRMUSER       10A  O  3  8
     A                                      COLOR(WHT)
     A            FRMDTE         8  0O  3 57
     A                                      EDTWRD('  /  /    ')
     A                                      COLOR(BLU)
     A                                  3 68'-'
     A                                      COLOR(BLU)
     A            TODATE         8  0O  3 70
     A                                      EDTWRD('  /  /    ')
     A                                      COLOR(BLU)
     A                                  4  2'                                  -
     A                                                                         -
     A                                               '
     A                                      DSPATR(UL)
     A                                      COLOR(BLU)
     A            MESG        1200A  O  5  1
     A                                      COLOR(WHT)
     A                                 20  2'                                  -
     A                                                                         -
     A                                               '
     A                                      COLOR(BLU)
     A                                      DSPATR(UL)
     A                                 22  2'F3 = Quit'
     A                                      COLOR(BLU)
     A                                 22 14'F4 = Delete '
     A                                      COLOR(BLU)
     A                                 22 28'ROLL/UP = Previous/MSG'
     A                                      COLOR(BLU)
     A                                 22 52'ROLL/DOWN = Next/MSG'
     A                                      COLOR(BLU)
      * FOR DISPLAYING MESSAGES TO USER.
     A            MSG           70A  O 24  3
     A  96                                  COLOR(RED)
