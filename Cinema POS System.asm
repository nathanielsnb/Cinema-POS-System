.386
.model flat, stdcall
.stack 4096

INCLUDE Irvine32.inc

ExitProcess PROTO, dwExitCode: DWORD


;---------------------------- Data Segment ----------------------------;
.data

;------------------------Login section-----------------------
	banner			BYTE		 42 DUP("_"), 0dh, 0ah,
								"|                                        |", 0dh, 0ah,
								"|               Welcome to               |", 0dh, 0ah,
								"|             Hao Kan Cinema             |", 0dh, 0ah,
								"|          Ticket Buying System          |", 0dh, 0ah,
								"|",40 DUP("_") , "|", 0dh, 0ah, 0dh, 0ah,
								"Please choose a number to proceed.", 0dh, 0ah,
								"1. Login", 0dh, 0ah,
								"2. Sign Up", 0dh, 0ah,
								"3. Continue as guest", 0dh, 0ah, 0dh, 0ah, 0
	inputmenu		BYTE		"Enter your choice: ", 0
	errormsg1		BYTE		"Invalid input, choose number 1, 2 or 3 only.", 0dh, 0ah, 0
	login			BYTE		30 DUP("*"), 0dh, 0ah,
								"!         Login Page         !", 0dh, 0ah,
								30 DUP("*"), 0dh, 0ah, 0dh, 0ah,
								"Please enter username and password.", 0dh, 0ah, 0
	inputusername	BYTE		"Username: ", 0
	inputpassword	BYTE		"Password: ", 0
	usernameinput	BYTE		30 DUP(?)
	passwordinput	BYTE		30 DUP(?)
	loginsuccess	BYTE		"Login successfully.", 0dh, 0ah, 0
	loginfail		BYTE		"Login failed, invalid username or password. Do you want to continue to login? (y/n)", 0dh, 0ah, 0
	actionerror		BYTE		"Please choose 'y' and 'n' only. Do you want to continue to login? (y/n)", 0dh, 0ah, 0
	membership		BYTE		30h


;------------------------Sign up section------------------------
	signuptime		BYTE		0
	signup			BYTE		31 DUP("*"), 0dh, 0ah,
								"!          Signup Page        !", 0dh, 0ah,
								31 DUP("*"), 0dh, 0ah, 0dh, 0ah,
								"Welcome to sign up page.", 0dh, 0ah, 0
	signupinput		BYTE		0dh, 0ah, "Please enter your information.", 0dh, 0ah, 0
	inputname		BYTE		"Name: ", 0
	inputage		BYTE		"Age: ", 0
	inputemail		BYTE		"Email: ", 0
	inputphone		BYTE		"Phone Number: ", 0
	nameinput		BYTE		30 DUP(?)
	ageinput		BYTE		?
	emailinput		BYTE		30 DUP(?)
	phoneinput		BYTE		30 DUP(?)
	errormsg2		BYTE		"Invalid input, age should a number be greater than 0 and less than 129.", 0dh, 0ah, 0
	errormsg3		BYTE		"Empty input is invalid, please try again.", 0dh, 0ah, 0
	errormsg4		BYTE		"Invalid inputs, please enter numbers only ('-' is not allowed).", 0dh, 0ah, 0
	usernamepassword	BYTE	"Please create a username and password.", 0dh, 0ah, 0
	username		BYTE		30 DUP(?)
	password		BYTE		30 DUP(?)
	adminusername	BYTE		"Admin", 0
	adminpassword	BYTE		"12345", 0
	signupsuccess	BYTE		0dh, 0ah, "The sign up is successful.", 0dh, 0ah, 0
	signupalready	BYTE		0dh, 0ah, "You've already signed up.", 0dh, 0ah, 0


;-----------Movie selection section------------
	inputmov		byte		?
	movlist			byte		30 dup ("-"), 0dh, 0ah,
								"  MOVIE LIST", 0dh, 0ah, 0dh, 0ah, 
								"  1. Wonder Woman 1984", 0dh, 0ah, 
								"  2. Avengers: Endgame", 0dh, 0ah, 
								"  3. Parasite", 0dh, 0ah, 
								"  4. Jumanji: The Next Level", 0dh, 0ah, 
								"  5. The Lion King", 0dh, 0ah, 
								30 dup ("-"), 0dh, 0ah, 0dh, 0ah
	prompt1			byte		"Please Choose your movie selection (1-5): ", 0
	mov1			byte		0ah, 0dh, "Your movie selection is ", "Wonder Woman 1984", 0dh, 0ah, 0 
	mov2			byte		0ah, 0dh, "Your movie selection is ", "Avengers: Endgame",	0dh, 0ah, 0
	mov3			byte		0ah, 0dh, "Your movie selection is ", "Parasite", 0dh, 0ah, 0
	mov4			byte		0ah, 0dh, "Your movie selection is ", "Jumanji: The Next Level", 0dh, 0ah, 0
	mov5			byte		0ah, 0dh, "Your movie selection is ", "The Lion King", 0dh, 0ah, 0dh, 0ah, 0
	choosemovie		byte		?
	prompt2			byte		0dh, 0ah, "ERROR!",
								"Please reselect your movie. (1-5) : ", 0


;----------Seat Selection section------------
	inputseat		byte		0
	inputyn			byte		?
	inputseatamt	byte		?
	amountticket	dword		?
	screen			byte		0dh, 0ah, 26 dup ("_"), 0dh, 0ah,
								10 dup (" "), "SCREEN", 10 dup (" "), 0ah,
								26 dup ("_"), 0dh, 0ah, 0dh, 0ah,
	seatrowa		byte		"10 ", "11 ", "12 ", "13 ", "14 ", "15 ", "16 ", "17 ", "18 ", "19 ", 0dh, 0ah,
								"20 ", "21 ", "22 ", "23 ", "24 ", "25 ", "26 ", "27 ", "28 ", "29 ", 0dh, 0ah,
								"30 ", "31 ", "32 ", "33 ", "34 ", "35 ", "36 ", "37 ", "38 ", "39 ", 0dh, 0ah,
	seatrowd		byte		"40 ", "41 ", "42 ", "43 ", "44 ", "45 ", "46 ", "47 ", "48 ", "49 ", 0dh, 0ah,
								"50 ", "51 ", "52 ", "53 ", "54 ", "55 ", "56 ", "57 ", "58 ", "59 ", 0dh, 0ah, 0dh, 0ah, 0
	prompt3			byte		"Kindly choose your seat selection : ", 0
	prompt4			byte		0dh, 0ah, 0dh, 0ah, "Do you confirm with your selection? (y/n): ", 0
	prompt5			byte		0dh, 0ah, 0dh, 0ah, "ERROR! Kindly reselect your seat: ", 0
	prompt8			byte		0dh, 0ah, 0dh, 0ah, "How many ticket do you want to buy? ", 0
	prompt9			byte		0dh, 0ah, 0dh, 0ah,"ERROR!! Kindly choose number from  1 to 3. ", 0

;-----------Calculation Section------------
	ticketprice		word		960
	totaltp			word		0
	ticketpricerm	byte		?
	ticketpricesen	byte		?
	hundred			byte		100

;Prompt user on buying more ticket Section
	inputyn2		byte		?
	prompt7			byte		0dh, 0ah, 0dh, 0ah, "Do you want to buy more tickets? (y/n): ",0

;Display the summary section
	movtitle		byte		0dh, 0ah, "Movie Title: ", 0
	seatlocate		byte		"Seat Location: ", 0
	tktprice		byte		0dh, 0ah, "Total Ticket Prices: RM ", 0

;------------prompt user to buy snacks section------------
	inputyn3		byte		?
	snacknochoose	byte		30h
	sprompt1		byte		0dh, 0ah, "Do you want to buy some snacks? (y/n): ", 0
	sprompt2		byte		0dh, 0ah, 0ah, 0dh, "ERROR! Kindly reselect the correct character (y/n): "


;------------prompt user choose food or drinks section-------------
	
	sprompt3		byte		0dh, 0ah, "ERROR!!, Kindly choose again." ,0ah, 0dh,

;-----------------Food menu section--------------
	foodinput		byte		?
	foodlist		byte		0dh, 0ah,
								"  ", 38 dup ("-"), 0dh, 0ah,
								" |", "  1. Caramel Popcorn		RM 5.00", " |", 0dh, 0ah,
								" |", "  2. Corn Dog			RM 7.00", " |", 0dh, 0ah,
								" |", "  3. Cheesy Wedges		RM 6.00", " |", 0dh, 0ah,
								" |", "  4. Chicken Wrap		RM 5.50", " |", 0dh, 0ah,
								" |", "  5. Beef Wrap		RM 5.50", " |", 0dh, 0ah,
								"  ", 38 dup ("-"), 0dh, 0ah, 0dh, 0ah,
								"Kindly choose your food selection (1-5): ",  0
	food1			byte		0ah, 0dh, "Your food selection is ", "Caramel Popcorn", 0dh, 0ah, 0
	food2			byte		0ah, 0dh, "Your food selection is ", "Corn Dog", 0dh, 0ah, 0
	food3			byte		0ah, 0dh, "Your food selection is ", "Cheesy Wedges", 0dh, 0ah, 0
	food4			byte		0ah, 0dh, "Your food selection is ", "Chicken Wraps", 0dh, 0ah, 0
	food5			byte		0ah, 0dh, "Your food selection is ", "Beef Wraps", 0dh, 0ah, 0
	choosefood		byte		0
	sprompt4			byte		0dh, 0ah, "Do you want to proceed with this selection? (y/n):  ", 0

;--------------Drink menu section------------
	drinkinput		byte		?
	drinklist		byte		0dh, 0ah,
								"  ", 38 dup ("-"), 0dh, 0ah,
								" |", "  1. Coca-Cola		RM 3.00"," |", 0dh, 0ah,
								" |", "  2. Pepsi			RM 3.00", " |", 0dh, 0ah,
								" |", "  3. Sprite			RM 2.50", " |", 0dh, 0ah,
								" |", "  4. 100 Plus			RM 2.00", " |", 0dh, 0ah,
								" |", "  5. Heaven & Earth		RM 4.00", " |", 0dh, 0ah, 
								"  ", 38 dup ("-"), 0dh, 0ah, 0dh, 0ah,
								"Kindly choose your drink selection (1-5): ", 0
	drink1			byte		0dh, 0ah, "Your drink selection is ", "Coca-Cola", 0dh, 0ah, 0
	drink2			byte		0dh, 0ah, "Your drink selection is ", "Pepsi", 0dh, 0ah, 0
	drink3			byte		0dh, 0ah, "Your drink selection is ", "Sprite", 0dh, 0ah, 0
	drink4			byte		0dh, 0ah, "Your drink selection is ", "100 Plus", 0dh, 0ah, 0
	drink5			byte		0dh, 0ah, "Your drink selection is ", "Heaven & Earth", 0dh, 0ah, 0
	choosedrink		byte		0


;----------- Calculation Section----------
	food1price		word		500
	food2price		word		700
	food3price		word		600
	food4price		word		550
	food5price		word		550
	drink1price		word		300
	drink2price		word		300
	drink3price		word		250
	drink4price		word		200
	drink5price		word		400
	totalsp			word		0
	snackpricerm	byte		0
	snackpricesen	byte		0

	;----------- Display the summary section-----------
	foodname		byte		"Food: ", 0
	drinkname		byte		"Drink: ", 0
	snackprice		byte		"Total Snack Price: RM ", 0

;-----------------Billing section------------------------
	tax_rate		WORD		1 ; tax_rate = 0.10, will divide by 10 after multiple with tax_rate
	billbanner		BYTE		44 DUP("_"), 0dh, 0ah,
								"|                                          |", 0dh, 0ah,
								"|              Billing Module              |", 0dh, 0ah,
								"|", 42 DUP("_") , "|", 0dh, 0ah, 0

	moviechosen		BYTE		"Movie chosen", 0dh, 0ah,
								"------------", 0dh, 0ah, 0
	seatchosen		BYTE		"Seat number chosen", 0dh, 0ah,
								"------------------", 0dh, 0ah, 0
	snackchosen		BYTE		"Snack chosen", 0dh, 0ah,
								"------------", 0dh, 0ah, 0
	nosnack			BYTE		"No snack is chosen", 0dh, 0ah, 0
	ten				WORD		10
	discount_rate	WORD		0
	total_price		WORD		0
	discount		WORD		0
	total_price2	WORD		0
	tax				WORD		0
	grandtotal		WORD		0
	grandtotalrm	BYTE		?
	grandtotalsen	BYTE		?
	displaygrandtotal	BYTE	30 DUP("*"), 0dh, 0ah,
								"Grand Total Price: RM ", 0
	confirmpurchase	BYTE		"Do you confirm your purchase? (y/n) ", 0
	actionyes		BYTE		"Payment is successful, thank you for your purchase.", 0dh, 0ah, 0
	continue		BYTE		"Do you want to continue using Ticketing System? (y/n) ", 0
	actionerroryn	BYTE		"Invalid input, please choose 'y' or 'n' only.", 0dh, 0ah, 0

;---------------------------- Code Segment ----------------------------;
.code
main PROC

;|||||||||||||||||||||||||||MEMBERSHIP MODULE||||||||||||||||||||||||||||||||;

;------- Display the Membership Module Banner
START:
Call Crlf
mov membership, 30h
mov	edx, offset banner
call WriteString
	
;--- Prompt the user to enter number input
READINPUT:
	mov edx, offset inputmenu
	call WriteString
	call ReadInt

;--- Validate the input from the user
ERRORCHECK1:
	cmp al, 1D
	je	LOGINPAGE		; Proceed to login page when the user inputs 1
	jg	ERRORCHECK2
	jl	ERROR1

ERRORCHECK2:
	cmp al, 2D
	je	SIGNUPPAGE		; Proceed to signup page when the user inputs 2
	jg	ERRORCHECK3

ERRORCHECK3:
	cmp al, 3D
	je	GUEST		; Proceed to the end of Membership Module
	jg	ERROR1

ERROR1:
	mov edx, offset errormsg1	; Display error message
	Call WriteString
	jmp READINPUT	; Go back to prompt the user to enter input again
	
;------- Display login page
LOGINPAGE:
	mov eax, 0
	mov edx, offset login
	Call WriteString

;--- Prompt the user to enter username
LOGIN_USERNAME:
mov edx, offset inputusername
Call WriteString

;--- The input username is stored
mov edx, offset usernameinput
mov ecx, lengthof usernameinput
Call ReadString
cmp eax, 0
jne LOGIN_PASSWORD

;--- Display error message if user enter nothing as input
mov edx, offset errormsg3
Call WriteString
jmp LOGIN_USERNAME

LOGIN_PASSWORD:
Call Crlf
;--- Prompt the user to enter password
mov edx, offset inputpassword
Call WriteString

;--- The input password is stored
mov edx, offset passwordinput
mov ecx, lengthof passwordinput
Call ReadString
cmp eax, 0
jne NEXT1

;--- Display error message if user enter nothing as input
mov edx, offset errormsg3
Call WriteString
jmp LOGIN_PASSWORD

NEXT1:
;--- The input username and password are compared with the admin username and password first
mov ecx, lengthof adminusername
mov eax, 0
mov esi, 0
READADMINUSERNAME:
	mov al, adminusername + [esi]
	mov ah, usernameinput + [esi]
	inc esi
	cmp al, ah
	jne ADMINNOMATCH
loop READADMINUSERNAME
mov ecx, lengthof adminpassword
mov eax, 0
mov esi, 0
READADMINPASSWORD:
	mov al, adminpassword + [esi]
	mov ah, passwordinput + [esi]
	inc esi
	cmp al, ah
	jne ADMINNOMATCH
loop READADMINPASSWORD
jmp LOGIN_SUCCESS

;--- The input username are compared with the signed up username and password
ADMINNOMATCH:
mov ecx, lengthof username
mov eax, 0
mov esi, 0
READUSERNAME:
	mov al, username + [esi]
	mov ah, usernameinput + [esi]
	inc esi
	cmp al, ah
	jne NOMATCH
loop READUSERNAME
mov ecx, lengthof password
mov eax, 0
mov esi, 0
READPASSWORD:
	mov al, password + [esi]
	mov ah, passwordinput + [esi]
	inc esi
	cmp al, ah
	jne NOMATCH
loop READPASSWORD
jmp LOGIN_SUCCESS

;--- Login is failed if the username and password are unmatched.
;--- Then the user is asked whether to continue login or not.
NOMATCH:
	mov edx, offset loginfail
	Call WriteString
ACTIONCHK:
	Call ReadChar
	cmp al, 79h
	je LOGINPAGE
	cmp al, 6Eh
	je START
	mov edx, offset actionerror
	Call WriteString
jmp ACTIONCHK
		
;--- The input username and password are compared to the stored username and password
LOGIN_SUCCESS:
	mov edx, offset loginsuccess
	Call WriteString
	mov membership, 31h
	jmp COMPLETE1

;------- Display sign up page
SIGNUPPAGE:
	cmp signuptime, 0	; User cannot sign up again after sign up for one time
	jne ALREADYSIGNUP

	mov eax, 0
	mov edx, offset signup
	Call WriteString
	
;--- Prompt the user to enter information (name, age, email and phone number)
mov edx, offset signupinput
Call WriteString
INPUT_NAME:
;--- Prompt the user to enter name
mov edx, offset inputname
Call WriteString

;--- The input name is stored
mov edx, offset nameinput
mov ecx, lengthof nameinput
Call ReadString
cmp eax, 0
jne NEXT2

;--- Display error message if user enter nothing as input
mov edx, offset errormsg3
Call WriteString
jmp INPUT_NAME

NEXT2:
;--- Prompt the user to enter age
READINPUTAGE:
	mov edx, offset inputage
	Call WriteString
	Call ReadInt
;--- Validate the user input
ERRORCHECK4:
	cmp al, 0
	jg NEXT3
mov edx, offset errormsg2 ; Display error message
Call WriteString
jmp READINPUTAGE

NEXT3:
mov ageinput, al
	Call Crlf
INPUT_EMAIL:
;--- Prompt the user to enter email
mov edx, offset inputemail
Call WriteString
	;--- The input email is stored
mov edx, offset emailinput
mov ecx, lengthof emailinput
Call ReadString
cmp eax, 0
jne NEXT4

;--- Display error message if user enter nothing as input
mov edx, offset errormsg3
Call WriteString
jmp INPUT_EMAIL

NEXT4:
Call Crlf
INPUT_PHONE:
;--- Prompt the user to enter phone number
mov edx, offset inputphone
Call WriteString

;--- The input phone number is stored
mov edx, offset phoneinput
mov ecx, lengthof phoneinput
Call ReadString
cmp eax, 0
jne NEXT5

;--- Display error message if user enter nothing as input
mov edx, offset errormsg3
Call WriteString
jmp INPUT_PHONE

NEXT5:
;--- Validate the user input
mov ecx, eax
mov esi, 0
READPHONE:
	mov al, phoneinput + [esi]
	inc esi
	cmp al, 30h
	jb ERRPHONE
	jae ERRCHKPHONE
ERRCHKPHONE:
	cmp al, 39h
	jbe NOERR
ERRPHONE:
	mov edx, offset errormsg4
	Call WriteString
	jmp INPUT_PHONE
NOERR:
loop READPHONE

;--- Prompt the user to enter username and password
Call Crlf
mov edx, offset usernamepassword
Call WriteString
INPUT_USERNAME:
Call Crlf
;--- Prompt the user to enter username
mov edx, offset inputusername
Call WriteString

;--- The input username is stored
mov edx, offset username
mov ecx, lengthof username
Call ReadString
cmp eax, 0
jne NEXT6

;--- Display error message if user enter nothing as input
mov edx, offset errormsg3
Call WriteString
jmp INPUT_USERNAME

NEXT6:
INPUT_PASSWORD:
Call Crlf
;--- Prompt the user to enter password
mov edx, offset inputpassword
Call WriteString

;--- The input password is stored
mov edx, offset password
mov ecx, lengthof password
Call ReadString
cmp eax, 0
jne NEXT7

;--- Display error message if user enter nothing as input
mov edx, offset errormsg3
Call WriteString
jmp INPUT_PASSWORD

NEXT7:
Call Crlf
;--- The sign up is completed
mov edx, offset signupsuccess
Call WriteString
inc signuptime
jmp START

ALREADYSIGNUP:
	mov edx, offset signupalready
	Call WriteString
	jmp START
	
;----- Guest does not have membership
GUEST:
	mov membership, 30h

COMPLETE1:

Call Crlf
Call Crlf

;||||||||||||||||||||||||||||||TICKETS BUYING MODULE||||||||||||||||||||||||||||||||||||;

;----- 1. Prompt user to select a movie -----
mov inputseat, 0
mov totaltp, 0
mov ticketpricerm, 0
mov ticketpricesen, 0
MOVDISPLAY:
	mov		edx, offset movlist
	call	writestring
	call	ReadInt
	mov		inputmov, al

COMPARE1:
	cmp		inputmov, 1
	je		MOVIE1
	cmp		inputmov, 2
	je		MOVIE2
	cmp		inputmov, 3
	je		MOVIE3
	cmp		inputmov, 4
	je		MOVIE4
	cmp		inputmov, 5
	je		MOVIE5
	jne 	ERROR

MOVIE1:
	mov		edx, offset mov1
	call	writestring
	mov		choosemovie, 1
	jmp		TICKETAMT

MOVIE2:
	mov		edx, offset mov2
	call	writestring
	mov		choosemovie, 2
	jmp		TICKETAMT

MOVIE3:
	mov		edx, offset mov3
	call	writestring
	mov		choosemovie, 3
	jmp		TICKETAMT

MOVIE4:
	mov		edx, offset mov4
	call	writestring
	mov		choosemovie, 4
	jmp		TICKETAMT

MOVIE5:
	mov		edx, offset mov5
	call	writestring
	mov		choosemovie, 5
	jmp		TICKETAMT

ERROR:
	mov		edx, offset prompt2
	call	WriteString
	jmp		MOVDISPLAY
	

;----- 2. Seat Selection
TICKETAMT:
	mov		edx, offset prompt8
	call	writestring
	call	readdec
	mov		amountticket, eax
	cmp		amountticket, 0
	jbe		ERROR3
	cmp		amountticket, 4
	jae		ERROR3

SEATDISPLAY:
	mov		edx, offset screen
	call	writestring
	mov		ecx,  amountticket	
	mov		esi, 0

READSEAT:
	mov		edx, offset prompt3
	call	writestring
	call	Readint
	mov		[inputseat + esi], al


COMPARE3:
	cmp		[inputseat + esi], 9
	jbe		ERROR2
	cmp		[inputseat + esi], 60
	jae		ERROR2
	add		esi, type inputseat
	loop	READSEAT
	jmp		CALCULATE

ERROR2:
	mov		edx, offset prompt5
	call	WriteString
	mov		eax, 0
	jmp		READSEAT

ERROR3:
	mov		edx, offset prompt9
	call	writestring
	jmp		TICKETAMT

;------ 3. Calculation of the ticket

CALCULATE:
	mov		eax, 0
	mov		ax, ticketprice
	mov		bx, word ptr amountticket
	mul		bx
	mov		totaltp, ax

;----- 4. Display the summary
MOVIETITLE:
	mov		edx, offset movtitle
	call	writestring


COMPARE4:
	cmp		inputmov, 1
	je		MOVIE11
	cmp		inputmov, 2
	je		MOVIE22
	cmp		inputmov, 3
	je		MOVIE33
	cmp		inputmov, 4
	je		MOVIE44
	cmp		inputmov, 5
	je		MOVIE55
	jne 	ERROR

MOVIE11:
	mov		edx, offset mov1
	add		edx, 25
	call	writestring
	jmp		SEATLOCATION

MOVIE22:
	mov		edx, offset mov2
	add		edx, 25
	call	writestring
	jmp		SEATLOCATION

MOVIE33:
	mov		edx, offset mov3
	add		edx, 25
	call	writestring
	jmp		SEATLOCATION

MOVIE44:
	mov		edx, offset mov4
	add		edx, 25
	call	writestring
	jmp		SEATLOCATION

MOVIE55:
	mov		edx, offset mov5
	add		edx, 25
	call	writestring
	jmp		SEATLOCATION

SEATLOCATION:
	mov		edx, offset	seatlocate
	call	writestring
	mov		ecx, amountticket
	mov		esi, 0

WRITESEAT:
	mov		edx, 0
	mov		eax, 0
	mov		al, [inputseat + esi]
	call	writedec
	add		esi, type inputseat
	mov		al, " "
	call	writechar
	loop	WRITESEAT

TOTALPRICE:
	mov		eax, 0
	mov		ax, totaltp
	div		hundred
	add		ticketpricerm, al
	mov		ticketpricesen, ah
	mov		edx, offset	tktprice
	call	writestring
	mov		eax, 0
	mov		al, ticketpricerm
	Call	WriteDec
	mov		al, "."
	Call	WriteChar
	mov		al, ticketpricesen
	Call	 WriteDec

Call Crlf
Call Crlf

;|||||||||||||||||||||||||||||||||||||||||||||SNACKS BUYING MODULE||||||||||||||||||||||||||||||||||||||||||;
mov totalsp, 0
mov snackpricerm, 0
mov snackpricesen, 0
;----- 1. Prompt user to buy snacks
SPROMPT:
	mov		edx, offset sprompt1
	call	writestring
	call	readchar
	mov		inputyn, al

COMPAREY:
	cmp		inputyn, 'y'
	je		FOOD
	jne		COMPAREN

COMPAREN:
	cmp		inputyn, 'n'
	je		NOCHOOSESNACK
	jne		ERRORSNACK

ERRORSNACK:
	mov		edx, offset sprompt2
	call	writestring
	jmp		SPROMPT



;----- 2. Food Menu
FOOD:
	mov		totalsp, 0
	mov		snackpricerm, 0
	mov		snackpricesen, 0
	mov		edx, offset foodlist
	call	writestring
	call	readint
	mov		foodinput, al

COMPARE2:
	cmp		foodinput, 1
	je		FOODS1
	cmp		foodinput, 2
	je		FOODS2
	cmp		foodinput, 3
	je		FOODS3
	cmp		foodinput, 4
	je		FOODS4
	cmp		foodinput, 5
	je		FOODS5
	jne 	ERROR4

FOODS1:
	mov		eax, 0
	mov		edx, offset food1
	call	writestring
	mov		ax, food1price
	add		totalsp, ax
	jmp		DRINK

FOODS2:
	mov		eax, 0
	mov		edx, offset food2
	call	writestring
	mov		ax, food2price
	add		totalsp, ax
	jmp		DRINK

FOODS3:
	mov		eax, 0
	mov		edx, offset food3
	call	writestring
	mov		ax, food3price
	add		totalsp, ax
	jmp		DRINK

FOODS4:
	mov		eax, 0
	mov		edx, offset food4
	call	writestring
	mov		ax, food4price
	add		totalsp, ax
	jmp		DRINK

FOODS5:
	mov		eax, 0
	mov		edx, offset food5
	call	writestring
	mov		ax, food5price
	add		totalsp, ax
	jmp		DRINK

ERROR4:
	mov		edx, offset sprompt3
	call	writestring
	jmp		FOOD



;----- 3. Drink Menu
DRINK:
	mov		edx, offset drinklist
	call	writestring
	call	readint
	mov		drinkinput, al

COMPARE5:
	cmp		drinkinput, 1
	je		DRINKS1
	cmp		drinkinput, 2
	je		DRINKS2
	cmp		drinkinput, 3
	je		DRINKS3
	cmp		drinkinput, 4
	je		DRINKS4
	cmp		drinkinput, 5
	je		DRINKS5
	jne 	ERROR5

DRINKS1:
	mov		eax, 0
	mov		edx, offset drink1
	call	writestring
	mov		ax, drink1price
	add		totalsp, ax
	jmp		DPROMPT

DRINKS2:
	mov		eax, 0
	mov		edx, offset drink2
	call	writestring
	mov		ax, drink2price
	add		totalsp, ax
	jmp		DPROMPT

DRINKS3:
	mov		eax, 0
	mov		edx, offset drink3
	call	writestring
	mov		ax, drink3price
	add		totalsp, ax
	jmp		DPROMPT

DRINKS4:
	mov		eax, 0
	mov		edx, offset drink4
	call	writestring
	mov		ax, drink4price
	add		totalsp, ax
	jmp		DPROMPT

DRINKS5:
	mov		eax, 0
	mov		edx, offset drink5
	call	writestring
	mov		ax, drink5price
	add		totalsp, ax
	jmp		DPROMPT

ERROR5:
	mov		edx, offset sprompt3
	call	writestring
	jmp		DRINK

DPROMPT: 
	mov		edx, offset sprompt4
	call	writestring
	call	readchar
	mov		inputyn3, al

COMPARE6:
	cmp		inputyn3, 'y'
	je		SUMMARY
	cmp		inputyn3, 'n'
	je		FOOD
	jne		ERROR6

ERROR6:
	mov		edx, offset sprompt3
	call	writestring
	jmp		DPROMPT


;----- 4. Display the summary
SUMMARY:
	Call Crlf
	Call Crlf
	mov		edx, offset foodname
	call	writestring
	
	cmp		foodinput, 1
	je		FOOD11
	cmp		foodinput, 2
	je		FOOD22
	cmp		foodinput, 3
	je		FOOD33
	cmp		foodinput, 4
	je		FOOD44
	cmp		foodinput, 5
	je		FOOD55
	jne 	ERRORSNACK

FOOD11:
	mov		edx, offset food1
	add		edx, 25
	call	writestring
	jmp		DRINKS

FOOD22:
	mov		edx, offset food2
	add		edx, 25
	call	writestring
	jmp		DRINKS

FOOD33:
	mov		edx, offset food3
	add		edx, 25
	call	writestring
	jmp		DRINKS

FOOD44:
	mov		edx, offset food4
	add		edx, 25
	call	writestring
	jmp		DRINKS

FOOD55:
	mov		edx, offset food5
	add		edx, 25
	call	writestring
	jmp		DRINKS

DRINKS:
	mov		edx, offset drinkname
	call	writestring

	cmp		drinkinput, 1
	je		DRINK11
	cmp		drinkinput, 2
	je		DRINK22
	cmp		drinkinput, 3
	je		DRINK33
	cmp		drinkinput, 4
	je		DRINK44
	cmp		drinkinput, 5
	je		DRINK55
	jne 	ERRORSNACK

DRINK11:
	mov		edx, offset drink1
	add		edx, 26
	call	writestring
	jmp		SNACKTOTAL

DRINK22:
	mov		edx, offset drink2
	add		edx, 26
	call	writestring
	jmp		SNACKTOTAL

DRINK33:
	mov		edx, offset drink3
	add		edx, 26
	call	writestring
	jmp		SNACKTOTAL

DRINK44:
	mov		edx, offset drink4
	add		edx, 26
	call	writestring
	jmp		SNACKTOTAL

DRINK55:
	mov		edx, offset drink5
	add		edx, 26
	call	writestring
	jmp		SNACKTOTAL

SNACKTOTAL:	
	mov		eax, 0
	mov		ax, totalsp
	div		hundred
	add		snackpricerm, al
	mov		snackpricesen, ah
	mov		edx, offset snackprice
	call	writestring
	mov		eax, 0
	mov		al, snackpricerm
	call	writedec
	mov		al, "."
	call	writechar
	mov		al, snackpricesen
	call	writedec
	cmp		al, 0
	jne		COMPLETE2
	mov		al, 0
	call	writedec
	jmp		COMPLETE2

NOCHOOSESNACK:
	mov snacknochoose, 31h

COMPLETE2:

Call Crlf
Call Crlf

;||||||||||||||||||||||||||||||BILLING MODULE|||||||||||||||||||||||||||||||||||||;
mov discount_rate, 0
mov total_price, 0
mov discount, 0
mov total_price2, 0
mov tax, 0
mov grandtotal, 0
mov grandtotalrm, 0
mov grandtotalsen, 0
;----- Display the Billing Module Banner
mov eax, 0
mov edx, offset billbanner
Call WriteString

;----- Display the movie chosen
mov edx, offset moviechosen
Call WriteString

cmp		inputmov, 1
je		MOVIE111
cmp		inputmov, 2
je		MOVIE222
cmp		inputmov, 3
je		MOVIE333
cmp		inputmov, 4
je		MOVIE444
cmp		inputmov, 5
je		MOVIE555
jne 	ERROR

MOVIE111:
	mov		edx, offset mov1
	add		edx, 25
	call	writestring
	jmp		BILLSEAT

MOVIE222:
	mov		edx, offset mov2
	add		edx, 25
	call	writestring
	jmp		BILLSEAT

MOVIE333:
	mov		edx, offset mov3
	add		edx, 25
	call	writestring
	jmp		BILLSEAT

MOVIE444:
	mov		edx, offset mov4
	add		edx, 25
	call	writestring
	jmp		BILLSEAT

MOVIE555:
	mov		edx, offset mov5
	add		edx, 25
	call	writestring
	jmp		BILLSEAT

BILLSEAT:
Call Crlf
Call Crlf
;----- Display the seat number chosen
mov edx, offset seatchosen
Call WriteString

mov ecx, amountticket
mov esi, 0
WRITESEAT2:
	mov		edx, 0
	mov		eax, 0
	mov		al, [inputseat + esi]
	call	writedec
	add		esi, type inputseat
	mov		al, " "
	call	writechar
loop	WRITESEAT2

Call Crlf
Call Crlf

;----- Display the ticket price
mov		edx, offset	tktprice
call	writestring
mov		eax, 0
mov		al, ticketpricerm
Call	WriteDec
mov		al, "."
Call	WriteChar
mov		al, ticketpricesen
Call	 WriteDec

Call Crlf
Call Crlf

;----- Display the snack chosen
mov edx, offset snackchosen
Call WriteString

cmp snacknochoose, 31h
je NOCHOOSESNACK2

mov		edx, offset foodname
call	writestring
	
cmp		foodinput, 1
je		FOOD111
cmp		foodinput, 2
je		FOOD222
cmp		foodinput, 3
je		FOOD333
cmp		foodinput, 4
je		FOOD444
cmp		foodinput, 5
je		FOOD555

FOOD111:
	mov		edx, offset food1
	add		edx, 25
	call	writestring
	jmp		DRINKSS

FOOD222:
	mov		edx, offset food2
	add		edx, 25
	call	writestring
	jmp		DRINKSS

FOOD333:
	mov		edx, offset food3
	add		edx, 25
	call	writestring
	jmp		DRINKSS

FOOD444:
	mov		edx, offset food4
	add		edx, 25
	call	writestring
	jmp		DRINKSS

FOOD555:
	mov		edx, offset food5
	add		edx, 25
	call	writestring
	jmp		DRINKSS

DRINKSS:
mov		edx, offset drinkname
call	writestring

cmp		drinkinput, 1
je		DRINK111
cmp		drinkinput, 2
je		DRINK222
cmp		drinkinput, 3
je		DRINK333
cmp		drinkinput, 4
je		DRINK444
cmp		drinkinput, 5
je		DRINK555

DRINK111:
	mov		edx, offset drink1
	add		edx, 26
	call	writestring
	jmp		BILLSNACKTOTAL

DRINK222:
	mov		edx, offset drink2
	add		edx, 26
	call	writestring
	jmp		BILLSNACKTOTAL

DRINK333:
	mov		edx, offset drink3
	add		edx, 26
	call	writestring
	jmp		BILLSNACKTOTAL

DRINK444:
	mov		edx, offset drink4
	add		edx, 26
	call	writestring
	jmp		BILLSNACKTOTAL

DRINK555:
	mov		edx, offset drink5
	add		edx, 26
	call	writestring
	jmp		BILLSNACKTOTAL

BILLSNACKTOTAL:
	mov		edx, offset snackprice
	call	writestring
	mov		eax, 0
	mov		al, snackpricerm
	call	writedec
	mov		al, "."
	call	writechar
	mov		al, snackpricesen
	call	writedec
	cmp		al, 0
	jne		CHECKMEMBER
	mov		al, 0
	call	writedec
	jmp		CHECKMEMBER

NOCHOOSESNACK2:
	mov edx, offset nosnack
	Call WriteString

CHECKMEMBER:
;----- Check whether the user has membership for discount
mov discount_rate, 0
cmp membership, 31h
jne NEXT
mov discount_rate, 2
;----- Calculate the grand total price (including discount and tax)
NEXT:
Call Crlf
	mov eax, 0
	add ax, totaltp
	add ax, totalsp
	mov total_price, ax
	mov ax, discount_rate
	cmp ax, 0
	je DISCOUNTNO
	mov ax, total_price
	mul discount_rate
	div ten
	mov discount, ax
jmp NEXT8

DISCOUNTNO:
	mov discount, 0

NEXT8:
	mov ax, total_price
	sub ax, discount		; minus with the discount price
	mov total_price2, ax
	mul tax_rate
	div ten					; calculate the tax
	mov tax, ax
	mov eax, 0
	mov ax, total_price2
	add ax, tax				; add tax to the price
	mov grandtotal, ax		; grand total price is get

;----- Display the grand total price
Call Crlf
mov		eax, 0
mov		ax, grandtotal
div		hundred
add		grandtotalrm, al
mov		grandtotalsen, ah
mov		edx, offset	displaygrandtotal
call	writestring
mov		eax, 0
mov		al, grandtotalrm
Call	WriteDec
mov		al, "."
Call	WriteChar
cmp		grandtotalsen, 10
jae		DISPLAYGRANDSEN
mov		eax, 0
Call	WriteDec
DISPLAYGRANDSEN:
mov		al, grandtotalsen
Call	WriteDec
cmp		grandtotalsen, 0
jne		FINISHDISPLAY
mov		eax, 0
Call	WriteDec

FINISHDISPLAY:
Call Crlf
Call Crlf
PURCHASECONFIRM:
mov edx, offset confirmpurchase
Call WriteString
Call ReadChar
Call WriteChar
cmp al, 'y'
je YESPURCHASE
cmp al, 'n'
je NOPURCHASE
mov edx, offset actionerroryn
Call WriteString
jmp PURCHASECONFIRM

YESPURCHASE:
	Call Crlf
	mov edx, offset actionyes
	Call WriteString

NOPURCHASE:
Call Crlf
mov edx, offset continue
Call WriteString
Call ReadChar
Call WriteChar
cmp al, 'y'
je START
cmp al, 'n'
je FINISH
mov edx, offset actionerroryn
Call WriteString
jmp NOPURCHASE

FINISH:

INVOKE ExitProcess,0

main ENDP
END main