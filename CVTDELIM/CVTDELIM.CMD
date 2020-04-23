/*===================================================*/
/* COMPANY NAME: HPA SYSTEMS                         */
/*===================================================*/
/* Application......: CONVERT COMMA DELIMITED FILE   */
/*                                                   */
/* Module Name......:                                */
/* Program Name.....:  CVTDELIM (COMMAND)            */
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

             CMD        PROMPT('CONVER COMMA DELIMITED FILE')
             PARM       KWD(FROMFILE) TYPE(QUAL1) MIN(1) +
                          PROMPT('FROM FILE Name')
             PARM       KWD(TOFILE) TYPE(QUAL1) MIN(1) +
                          PROMPT('TO FILE Name')

 QUAL1:      QUAL       TYPE(*NAME) LEN(10) DFT(SPLIBRK)

             QUAL       TYPE(*NAME) LEN(10) PROMPT('Library name')
 QUAL2:      QUAL       TYPE(*NAME) LEN(10) DFT(SPLIBRK)

             QUAL       TYPE(*NAME) LEN(10) PROMPT('Library name')
