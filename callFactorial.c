/*Ayodele Hamilton
*CMPSC 210
*Final Project
*
* Purpose:
*       result = _____n!_______
*                 (n-k)! * k!
* TO COMPILE:
* nasm -felf factorial.asm -o factorial.o
* gcc m32 factorial.o callfactorial.c -o callFact
*
* TO RUN:
* ./callFact
*/

#include <stdio.h>

/*Import NASM program, Binomial*/
/*extern int binomial(int input1, int input2);*/
/*Importing NASM Program, Factorial*/
extern int factorial(int input1, int input2);

int main() {
int input1, input2;
/*int a = 4;*/

/*Prompt the user*/
printf("Welcome to the Evaluator!!!\n");
printf("Please enter two digits to start a factorial:\n");
scanf("%d %d",&input1, &input2);

/*Prints out the answer for the two numbers*/
printf("NASM Programming Factorial: %d\n",binom(input1,input2));
printf("FINISHED THE PROGRAM. BYE!!\n");
}
