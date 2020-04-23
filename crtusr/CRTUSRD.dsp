      *** Source Created by:
      *** DATE: 03/15/1999
      *** AUTHOR: RICHARD KNECHTEL
      *** COMPILE WITH "RESTORE DIPSLAY = *YES"
      *** Source code edited using Flex/DESIGNER Version 2.0
      *
      * License:
      *
      * This program is free software; you can redistribute it 
      * and/or modify it under the terms of the GNU General 
      * Public License as published by the Free Software 
      * Foundation; either version 2 of the License, or (at 
      * your option) any later version.
      *
      * This program is distributed in the hope that it will 
      * be useful, but WITHOUT ANY WARRANTY; without even the 
      * implied warranty of MERCHANTABILITY or FITNESS FOR A 
      * PARTICULAR PURPOSE.  See the GNU General Public 
      * License for more details.
      *
      * You should have received a copy of the GNU General 
      * Public License along with this program; if not, 
      * write to the Free Software Foundation, Inc., 
      * 675 Mass Ave, Cambridge, MA 02139, USA.
      *
      *******************************************************************
     A                                      DSPSIZ(24 80 *DS3)                  
     A                                      CF03(03 'F03=EXIT')          
     A                                      PRINT                               
     A                                      VLDCMDKEY(28)                       
     A          R SCREEN1                                                       
     A                                      TEXT('SCREEN1')                     
     A                                  1  2DATE                                
     A                                      EDTCDE(Y)                           
     A                                  1 13TIME                                
     A                                  1 70SYSNAME                             990316
     A                                  1 32'Create User Profiles'              990316
     A                                      DSPATR(HI)                          
     A                                      DSPATR(UL)                          
     A                                  5  2'First Name:'                       990316
     A                                      COLOR(GRN)                          
     A                                      DSPATR(HI)                          
     A            FNAME         10A  B  5 16                                    990316
     A                                      COLOR(GRN)                          
     A                                      DSPATR(HI)                          
     A                                      DSPATR(UL)                          
     A                                  6  2'Last Name:'                        990316
     A                                      COLOR(GRN)                          
     A                                      DSPATR(HI)                          
     A            LNAME         15A  B  6 16                                    990316
     A                                      COLOR(GRN)                          
     A                                      DSPATR(HI)                          
     A                                      DSPATR(UL)                          
     A                                 23  3'ENTER=Update    F3=Exit'
     A                                      COLOR(GRN)                          
     A                                      DSPATR(HI)                          
     A                                  7  2'User Type:'                        990316
     A                                      COLOR(GRN)                          990316
     A                                      DSPATR(HI)                          990316
     A            USRTYP         1   B  7 16                                    990316
     A                                      DSPATR(HI)                          990316
     A                                      DSPATR(UL)                          990316
     A                                      COLOR(GRN)                          990316
     A                                      VALUES('1' '2')                     990317
     A                                  8  2'('                                 990316
     A                                      COLOR(GRN)                          990316
     A                                      DSPATR(HI)                          990316
     A                                  8  4'1'                                 990317
     A                                      COLOR(RED)                          990316
     A                                      DSPATR(HI)                          990316
     A                                  8  6' = User Type 1'                    990317
     A                                      COLOR(GRN)                          990316
     A                                      DSPATR(HI)                          990316
     A                                  8 28'2'                                 990317
     A                                      COLOR(RED)                          990316
     A                                      DSPATR(HI)                          990316
     A                                  8 31' = User Type 2)'                      990317
     A                                      COLOR(GRN)                          990316
     A                                      DSPATR(HI)                          990316
     A            ERROR         70   O 24  3                                    990317
     A                                      COLOR(RED)                          990317
     A                                      DSPATR(HI)                          990317
