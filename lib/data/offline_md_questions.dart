const offlineMdQuestions = {
  "passwordHint": r"""### Decrypt the given cipher text
```urltrrxf```  
Hint: 13 times it ROTs
""",
  "question1": r"""
## Question number {question_number}
Write a C/Java/Python function which calculates the roots of a quadratic equation using the quadratic formula.  
The function should have three parameters (float a, float b, float c) and should print (both) the root(s), or a relevant error message if the roots can't be found.  

The function should have the following signature:  
```
// In C/Java
void quadratic_formula(float a, float b, float c);	

// Python
def quadratic_formula(a, b, c)
```
""",
  "question2": r"""
## Question number {question_number}
Write a function which accepts a root node object/struct and prints its in-order traversal, but **WITHOUT** using recursion.  
  
Context:  

The node object in Java is 
```java
class Node {
	int value;
	Node left;		// left is null/None if no left subchild
	Node right;		// right is null/None if no right subchild
	Node(int value, Node left, Node right) {
		this.value = value;
		this left = left;
		this.right = right;
	}
	Node(int value) {
		this.value = value;
		this.left = null;
		this.right = null;
	}
}
```
Python  
```python
class Node:
	def __init__(self, value, left=None, right=None):
		self.value = value
		self.left = left
		self.right = right
```

Node struct in C is 
```c
struct Node {
	int value;
	Node * left;		// NULL if no child
	Node * right;		// NULL if no child
};
```

The function signature should be:
```
// In C and Java
void inorder_traversal(Node rootNode);

// Python
def inorder_traversal(rootNode)

```

Assume an unlimited global stack is pre-defined on all languages with the following functions available to use anywhere:
```
push(Node);
//Pushes the node on top of the stack

pop() or pop(Node *);
// Returns the top node (assigns to passed address if C).  
// If no element, returns null/NULL/None

isEmpty();
//Return 1/True if empty, else 0/False
```

Tip: If you really can't find a way to do it without recursion, do it using recursion. Although we won't give full marks for it
""",
  "question3": r"""
## Question number {question_number}
Write a function which accepts two signed integers, and finds the largest among them and returns it. But **WITHOUT** using any branching statements (if, else, ternary operator, switch, loops).  
  

Function signature should be:  
```
/// In C and Java
int largest(int a, int b);
/// In Python
def largest(a, b)  // returns int
```
Hint:  
* You can assume that the input integers will never be equal, they will always be different
* Signed integers are represented using 32 bits.  
* Signed integers are stored in 2's complement form.
* The most significant (leftmost) bit  holds the sign information, namely, if the integer is positive, it will be 0, if its negative, it will be 1  
* Right bit shift operator >> can be used to shift the bits, from which we can separate its sign bit.
* \>> operator still preserves the overall sign of the integer
""",
  "question4": r"""
## Question number {question_number}
Write a function which accepts a string, applies Atbash cipher and prints it.  
Atbash Cipher is a cipher method which substitutes each letter with its corresponding letter from the reverse of the alphabet.
ie, it uses the following substitution:
```
a => z
b => y
c => x
d => w
e => v
...
v => e
w => d
x => c
y => b
z => a
```
Assume that all input string is sanitized alphabets of lower case.  
Do it preferrably without simple substitution using dictionary/maps or a bunch of switch/case or a bunch of if/else conditions.  
  
The function signature should be:
```
// C
void atbash(char * plain_text);
// Python
def atbash(plain_text)
// Java
void atbash(String plain_text);
```

For convenience, the following string is defined globally
```
// C
char * alphabets = "abcdefg...uvwxyz";
// Python
alphabets = "abcdefg...uvwxyz"
// Java
String alphabets = "abcdefg...uvwxyz"
```
""",
  "question5": r"""
## Question number {question_number}
Debug either C or Python code **AND** add comments explaining the fixes

```C
#include<stdio.h>
int main()
{
 integer i,j,k;
 float a[3][3], b[3][3], mul[3][3];

 printf("Enter elements of first matrix:\n");
 for(i=0;i< 3;i++)
 {
  for(j=0;j< 3;j++)
  {
   printf("a[%d][d]=",i,j);
   scanf("%f", a[i][j]);
  }
 }
 
 printf("Enter elements of second matrix:\n");
 for(i=0;i< 3;i++)
 {
  for(j=0;j< 3;j++);
  {
   printf("b[%d][%d]=",i,j);
   scanf("%f", &b[i][j]);
  }
 }
 
 for(i=0;i< 3,i++)
 {
  for(j=0;j< 3;j++)
  {
   mul[i][j] = 0;
   for(k=0;k< 3;k++)
   {
    mul[i][j] = mul[i][j] + a[i][k]*b[k][j];
   }
  }
 }
 
 print("Multiplied matrix is:\n");
 for(i=0;i< 3;i++)
 {
  for(j=0;j< 3;j+)
  {
   printf("%f\t", mul[i][j]);
  }
  printf("\n");
 }
 return 0;
}
```  

Python  
```python
A=[[0, 0, 0],
   [0, 0, 0],
   [0, 0, 0],]
B=[[0, 0, 0],
   [0, 0, 0],
   [0, 0, 0],]
result=[[0, 0, 0],
        [0, 0, 0],
        [0  0, 0],]
for i in range(3):
	for j in range(3):
		a[i][j] = int(input(f"A[{i}][{j}]: "))
for i in range(3);
	for j in range(3):
		B[i][j] = input(int(f"B[{i}][{j}]: "))
for i in range(A.len):
	for j in range(len(B[0])):
		for k in range(len(B)):
			result[i][j] += A[i][k] * B[k][j]
for row in result:
	print(r)
```
""",
};
