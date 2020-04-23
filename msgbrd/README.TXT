                      Message Board V1.0
---------------------------------------------------------------------

This source is release under the General Public License (GPL) and is part
of the Open Source movement.  It was created on 12/01/2001


                         Installation

1. Upload the source members in whatever manner you choose.

2. Compile the source members in the following order:

(QDDSSRC)     MSGBRDPF     (Message file)
(QDDSSRC)     MSGBRDDF     (Message Board Display program Display file)(Compile with RSTDSP *YES)
(QDDSSRC)     MSGBRDMF     (Message Board Maintenance Display file)(Compile with RSTDSP *YES)
(QCLSRC)      MSGBRDCL     (Message Board Display program driver)
(QCLSRC)      MSGBRDMC     (Message Board Maintenance driver)
(QCLSRC)      STARTUP      (Sample Startup CL program to use)
(QRPGLESRC)   MSGBRDDR     (Message Board Display program)
(QRPGLESRC)   MSGBRDMR     (Message Board Maintenance program)
(QRPGLESRC)   MSGBRDRR     (Message Board Message Removal)
(QTXTSRC)     README       (Read Me File)     ** This file **
---------------------------------------------------------------------
                               Use
STARTUP:
The startup cl program is a sample way for ADMIN's to run the Message
Board Display program at logon. This will allow the admin to display
messages to users when they login.

MSGBRDDR:
This is the Message Board Display program. The screen will display the current
system date and time.  It will also display the users user ID as well as the
from/to dates the message will be displayed.  The function keys perform the
following functions. F3 will exit the screen, F4 will delete the currently
displayed message, ROLL/UP & ROLL/DOWN will page up and down through the
messages for that user or for "ALL" users.

MSGBRDMC:
This is the Message Board Maintenance progam.  This screen will display all messages
in the message file. This screen will display the current system date and time, as well
as the user ID.  The following action codes are valid: 2 is for updating a message and 4 is
for delete a message.  The following function keys do the following: F3 will exit the
maintenance program, F6 will allow you to create a new message. Also you can press
ROLL/UP & ROLL/DOWN to page up and down through message screens. When you press F6 you
will be taken to the Message create/update screen. On that screen F12 will take you back to
the main maintenance screen and F14 will process (add/update) the message.  The "To User"
field is where you can put a specific user id or use "all" to direct the message to ALL
users.

MSGBRDRR:
This will remove all expired messages.  Run this in a nightly
maintenance job or run it manually as needed/wanted.

==============================================================================================
KNOWN BUGS:
       1) DISPLAYS DATES WITH A YEAR > CURRENT YEAR FIRST - INSTEAD OF OLDEST MESSAGES FIRST.

==============================================================================================

---------------------------------------------------------------------
                          Requirements

Message Board was created on a AS/400 running V3R2 of OS/400.
---------------------------------------------------------------------


---------------------------------------------------------------------
                              Updates
v1.0 - Original release


-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

                   DISCLAIMER OF WARRANTY

 THIS SOFTWARE IS SOLD "AS IS" AND WITHOUT WARRANTIES AS TO
 PERFORMANCE OF MERCHANTABILITY OR ANY OTHER WARRANTIES WHETHER
 EXPRESSED OR IMPLIED. BECAUSE OF THE VARIOUS HARDWARE AND SOFTWARE
 ENVIRONMENTS INTO WHICH THIS PROGRAM MAY BE PUT, NO WARRANTY OF
 FITNESS FOR A PARTICULAR PURPOSE IS OFFERED.  GOOD DATA PROCESSING
 PROCEDURE DICTATES THAT ANY PROGRAM BE THOROUGHLY TESTED WITH
 NON-CRITICAL DATA BEFORE RELYING ON IT.  THE USER MUST ASSUME THE
 ENTIRE RISK OF USING THE PROGRAM.  ANY LIABILITY OF THE AUTHOR
 WILL BE LIMITED EXCLUSIVELY TO PRODUCT REPLACEMENT OR REFUND OF
 THE PURCHASE PRICE (WHICH IS $00 - AS THIS SOURCE/PROGRAM IS FREE!).

       If you do not agree, please do not use this product.


-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
