INCLUDE Irvine32.inc 
 
.data 
 
Title1 BYTE " ***************************", 0 
Title2 BYTE " * -CALCULATOR- *", 0 
Title3 BYTE " ***************************", 0 
 
prompt1 BYTE " Enter first number: ", 0 
prompt2 BYTE " Enter second number: ", 0 
menu BYTE " Choose operation - 1:Add, 2:Subtract, 3:Multiply, 4:Divide: ", 0 
invalidOp BYTE " Invalid operation selected!", 0 
resultMsg BYTE " The result is: ", 0 
 
.code 
main PROC 
 
 ; Display menu and get user choice 
 call displayMenu 
 mov ebx, eax 
 
 ; Read first number 
 call getNumber 
 mov ecx, eax 
 
 ; Read second number 
 call getSecondNumber 
 mov edx, eax 
 
 ; Perform selected operation 
 cmp ebx, 1 
 je AddNumbers 
 cmp ebx, 2 
 je SubtractNumbers 
 cmp ebx, 3 
 je MultiplyNumbers 
 cmp ebx, 4 
 je DivideNumbers 
 
 ; If invalid option is selected 
 call invalidOperation 
 jmp endProgram 
 
AddNumbers: 
 call addition 
 jmp displayResult 
 
SubtractNumbers: 
 call subtraction 
 jmp displayResult 
 
MultiplyNumbers: 
 call multiplication 
 jmp displayResult 
 
DivideNumbers: 
 call division 
 jmp displayResult 
 
displayResult: 
 ; Display the result 
 call Crlf 
 mov edx, OFFSET resultMsg 
 call WriteString 
 call WriteInt 
 call Crlf 
 call Crlf 
 
endProgram: 
 exit 
main ENDP 
 
; Procedure to display the menu and get user choice 
displayMenu PROC 
 call Crlf 
 mov edx, OFFSET Title1 
 call WriteString 
 call Crlf 
 mov edx, OFFSET Title2 
 call WriteString 
 call Crlf 
 mov edx, OFFSET Title3 
 call WriteString 
 call Crlf 
 call Crlf 
 call Crlf 
 mov edx, OFFSET menu 
 call WriteString 
 call ReadInt 
 ret 
displayMenu ENDP 
 
; Procedure to get a number from the user 
getNumber PROC 
 call Crlf 
 mov edx, OFFSET prompt1 
 call WriteString 
 call ReadInt 
 ret 
getNumber ENDP 
 
getSecondNumber PROC 
 call Crlf 
 mov edx, OFFSET prompt2 
 call WriteString 
 call ReadInt 
 ret 
getSecondNumber ENDP 
 
; Procedure for addition 
addition PROC 
 add ecx, edx 
 mov eax, ecx 
 ret 
addition ENDP 
 
; Procedure for subtraction 
subtraction PROC 
 sub ecx, edx 
 mov eax, ecx 
 ret 
subtraction ENDP 
 
; Procedure for multiplication 
multiplication PROC 
 mov eax, edx 
 mul ecx 
 ret 
multiplication ENDP 
 
division PROC 
 cmp edx, 0 
 je divByZero 
 mov edx, 0 
 div ecx 
 ret 
 
divByZero: 
 mov edx, OFFSET invalidOp 
 call WriteString 
 call Crlf 
 ret 
division ENDP 
 
; Procedure for invalid operation 
invalidOperation PROC 
 mov edx, OFFSET invalidOp 
 call WriteString 
 call Crlf 
 ret 
invalidOperation ENDP 
 
END main