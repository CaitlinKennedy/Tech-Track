drop table questions;
drop table courses;

create table courses(
	courseId INT NOT NULL AUTO_INCREMENT,
	courseName VARCHAR(100) NOT NULL,
	courseAbbreviation VARCHAR(5) NOT NULL,
	courseOverview TEXT NOT NULL,
	PRIMARY KEY(courseId)
	);

create table questions(
	questionId INT NOT NULL AUTO_INCREMENT,
	questionString TEXT NOT NULL,
	option1 TEXT NOT NULL,
	option2 TEXT NOT NULL,
	option3 TEXT NOT NULL,
	option4 TEXT NOT NULL,
	correctAnswer INT NOT NULL,
	courseId INT,
	FOREIGN KEY (courseId)
		REFERENCES courses(courseId)
		ON DELETE CASCADE,
	PRIMARY KEY(questionId)
	);

INSERT INTO courses VALUES(1, "Problem Solving and Object-Oriented Programming", "CS180", "Overview of the course...");
INSERT INTO courses VALUES(2, "Programming in C", "CS240", "CS240 is focused on teaching different programming concepts in C. Some topics covered include the basic C development cycle, data representation, the different operators available, the structure of a program, recursion, pointers and addresses, memory allocation, structures, abstraction, and file access. 
The C language is a high level assembly language. Many games and applications that need high performance use C. One of the advantages of C is that it is fast, but that also makes it vulnerable to safety problems. For example: when accessing an array Java will check the boundaries but C will not so assignments could take place in memory even if it is out of range. (QUESTION 1) Another benefit of C is that its programs are “Fast and Lean”, they typically use less than half of the size that a Java program would use.
In C, integers can be represented in a number of ways. First of all it is important to know that the different data types are made up of bits which are grouped into bytes (8 bits). These bytes can then store the different values. Integers can be represented as char, short int or short, int, long int or long, and in some architectures long long int or long long. A char is made up of 1 byte, a short is 2 bytes, an int is 4 bytes, a long is 8 bytes and a long long is 16 bytes. Other data types include integers, floats, doubles and strings. 
An important tool that programmers should be familiar with is GDB. GDB is a tool that helps debug a program by allowing the programmer to step through the execution of the program line by line. Being able to use GDb to debug a program can save days of time and will make any programmer better. To be able to use GDB one must compile their program with the -g option which adds debugging information to the program. Once the program is compiled it can be run with GDB by executing the command “gdb programName”. It is a good idea to set some  breakpoints in the program. A breakpoint is a place in the code where the execution will pause so the programmer can explore the current state of the programs execution. To set a breakpoint at the start of the main function type “break main”. Breakpoints can be placed anywhere in the program, as functions, in function, or even at specific lines. After all the breakpoints have been added the program can be run by typing “run”. Once a breakpoint is reached you will need to type “step” (run next line of code, enter function if it is a function call) or “next” (run next line of code, do not enter function if it is a function call). At any point while running the program you can run the command “where” and the backtrace of the current position will be displayed. You can also examine the different variables in your program by typing “print variableName”. Once you have finished running the program with GDB you enter the command “quit” to exit. ");
INSERT INTO courses VALUES(3, "name..", "CS250", "Overview of the course...");
INSERT INTO courses VALUES(4, "name..", "CS251", "Overview of the course...");
INSERT INTO courses VALUES(5, "name..", "CS314", "Overview of the course...");
INSERT INTO courses VALUES(6, "name..", "CS334", "Overview of the course...");
INSERT INTO courses VALUES(7, "name..", "CS381", "Overview of the course...");
INSERT INTO courses VALUES(8, "name..", "CS307", "Overview of the course...");
INSERT INTO courses VALUES(9, "name..", "CS448", "Overview of the course...");
INSERT INTO courses VALUES(10, "name..", "CS456", "Overview of the course...");
INSERT INTO courses VALUES(11, "name..", "CS442", "Overview of the course...");
INSERT INTO courses VALUES(12, "name..", "CS426", "Overview of the course...");

/* CS180 */
INSERT INTO questions VALUES(1,'What is something that is special about Java?','It uses Object Oriented Program', 'It does not use Object Oriented Programming', 'It is the only language with if statements', 'It is the only language with for loops', 1, 1);
INSERT INTO questions VALUES(2,'Which of the following does not print out “Hello World”','System.out.print(“Hello World”)', 'System.out.print(“Hello” + “World);', 'System.out.println(“Hello World”);', 'System.out.println(“Hello” + “ World”);', 2, 1);
INSERT INTO questions VALUES(3,'In the expression a%b, what does the % symbol do in java?','multiplies a and b and then converts it into a percentage', 'It is an invalid expression', 'Divides b by a and returns the remainder', 'Adds a to b', 3, 1);
INSERT INTO questions VALUES(4,'What is printed?int[] myIntArray = {1,2,3};System.println(myIntArray[0]);','array index out of bounds', 'InvalidAccesPointException', '1', '2', 3, 1);
INSERT INTO questions VALUES(5,'What is printed?int[] myIntArray = {1,2,3};System.println(myIntArray[3]);','ArrayIndexOutOfBoundsException', 'InvalidAccesPointException', '1', '2', 1, 1);

/* CS240 */
INSERT INTO questions VALUES(6,'Which assignment will be overwritten due to an out-of-bounds assignment assuming a and b are declared as int a[5]; and int b[3]?','a[2] = 789;', 'b[1] = 45;', 'a[6] = 317;', 'a[1] = 230;', 3, 2);
INSERT INTO questions VALUES(7,'Which group is not a way to represent an integer?','1 byte (char)', '2 bytes (short int or short)', '3 bytes (small int)', '4 bytes (int)', 3, 2);
INSERT INTO questions VALUES(8,'Which is not a command of GDB?','run', 'break function', 'step', 'prev', 4, 2);
INSERT INTO questions VALUES(9,'What does the char* strcat(char* dest, char* src) function do?','Copy the string src to dest.', 'Return the length of both strings.', 'Concatenate the string src after the string dest.', 'compare the strings and return >0 if src is larger alphabetically then dest, <0 if dest is larger than src, or 0 if they are equal.', 3, 2);
INSERT INTO questions VALUES(10,'When working with bitwise operators, what does the line unsigned y = (x & mask0); accomplish?','clear bit i', 'set bit i', 'test is bit i is set', 'negate bit i', 1, 2);

/* CS250 */
INSERT INTO questions VALUES(11,'What is a binary counter?','Decimal to binary or hexadecimal to binary converter.', 'A digital circuit which gives the number of clock cycles.', 'A variable in a function which increments during each iteration of a loop.', 'A CMOS logic gate.', 2, 3);
INSERT INTO questions VALUES(12,'The meaning of a bit string is:','known by the hardware', 'known by the compiler', 'known by the assembler', 'ours to define', 4, 3);
INSERT INTO questions VALUES(13,'How many distinct Boolean functions are there that have three inputs?','3', '2^3', '3^2', '2^8', 4, 3);
INSERT INTO questions VALUES(14,'Which of the following converts the programs written in assembly language to machine language?','machine compiler', 'interpreter', 'assembler', 'converter', 3, 3);
INSERT INTO questions VALUES(15,'The alternate way of writing the instruction, ADD #5,R1 is','ADD [5],[R1]', 'ADDI 5,R1', 'ADDIME 5,[R1]', 'There is no other way.', 2, 3);

/* CS251 */
INSERT INTO questions VALUES(16,'Algorithm X has running time of 2n^2 – 4nlogn + 16n. Which big-O expressions hold for algorithm X’s time?','O(n), O(nlogn), O(n^2)', 'O(n^2), O(n^3), O(2^n)', 'O(nlogn), O(n^2)', 'O(n^2)', 2, 4);
INSERT INTO questions VALUES(17,'Consider a sorted circular doubly-linked list where the head element points to the smallest elements in the list. One can find the largest element in what time? (Give the tightest bound.)','O(1)', 'O(n)', 'O(n logn)', 'O(logn)', 1, 4);
INSERT INTO questions VALUES(18,'What is the most appropriate data structure for modeling a supermarket checkout lane? Customers enter at the back and are checked out at the front. Sometimes, the last customer in line leaves.','Stack', 'Heap', 'Queue', 'Deque', 4, 4);
INSERT INTO questions VALUES(19,'An array of size n contains records with keys -15, 1, 5.5, 25, 125. The records can be sorted in O(n) time using what algorithm?','Heapsort', 'Insertion sort', 'Counting sort', 'Standard merge sort', 3, 4);
INSERT INTO questions VALUES(20,'A 2-3 tree has height k. After the insertion of  a key, the tree has what height?','k', 'k-1', 'k+1', 'k or k+1', 4, 4);

/* CS314 */
INSERT INTO questions VALUES(21,'Insert the question here...','option1 here', 'option2 here', 'option3 here', 'option4 here', 1, 5);
INSERT INTO questions VALUES(22,'Insert the question here...','option1 here', 'option2 here', 'option3 here', 'option4 here', 1, 5);
INSERT INTO questions VALUES(23,'Insert the question here...','option1 here', 'option2 here', 'option3 here', 'option4 here', 1, 5);
INSERT INTO questions VALUES(24,'Insert the question here...','option1 here', 'option2 here', 'option3 here', 'option4 here', 1, 5);
INSERT INTO questions VALUES(25,'Insert the question here...','option1 here', 'option2 here', 'option3 here', 'option4 here', 1, 5);

/* CS334 */
INSERT INTO questions VALUES(26,'Insert the question here...','option1 here', 'option2 here', 'option3 here', 'option4 here', 1, 6);
INSERT INTO questions VALUES(27,'Insert the question here...','option1 here', 'option2 here', 'option3 here', 'option4 here', 1, 6);
INSERT INTO questions VALUES(28,'Insert the question here...','option1 here', 'option2 here', 'option3 here', 'option4 here', 1, 6);
INSERT INTO questions VALUES(29,'Insert the question here...','option1 here', 'option2 here', 'option3 here', 'option4 here', 1, 6);
INSERT INTO questions VALUES(30,'Insert the question here...','option1 here', 'option2 here', 'option3 here', 'option4 here', 1, 6);

/* CS381 */
INSERT INTO questions VALUES(31,'Insert the question here...','option1 here', 'option2 here', 'option3 here', 'option4 here', 1, 7);
INSERT INTO questions VALUES(32,'Insert the question here...','option1 here', 'option2 here', 'option3 here', 'option4 here', 1, 7);
INSERT INTO questions VALUES(33,'Insert the question here...','option1 here', 'option2 here', 'option3 here', 'option4 here', 1, 7);
INSERT INTO questions VALUES(34,'Insert the question here...','option1 here', 'option2 here', 'option3 here', 'option4 here', 1, 7);
INSERT INTO questions VALUES(35,'Insert the question here...','option1 here', 'option2 here', 'option3 here', 'option4 here', 1, 7);

/* CS307 */
INSERT INTO questions VALUES(36,'What is one of the roles in scrum?','Project Coordinator', 'Product Owner', 'Product Owner', 'Product Buyer', 2, 8);
INSERT INTO questions VALUES(37,'Which of the following is true for reusability?','Reusing software will create copyright issues.', 'Reusability should be kept in mind when developing software to decrease cost and save time.', 'Reusing software will increase the cost when adapting the software to a new system.', 'Developing reusable software wastes time.', 2, 8);
INSERT INTO questions VALUES(38,'Which of the following is true for protocols?','Protocol is a security tool.', 'Protocol is a testing software.', 'Protocols serve the same importance to communications as programming languages do to computation', 'None of the above.', 3, 8);
INSERT INTO questions VALUES(39,'What does “git add” do?','Records the recent changes made.', 'View the state of files in the current directory.', 'Stage a file for commit.', 'Adds a new branch.', 3, 8);
INSERT INTO questions VALUES(40,'What is refactoring?','Changing the external behavior without changing the code.', 'Change the scrum roles and add more roles for better communication.', 'Only improve the readability of the code.', 'Restructure the existing code without changing the external behavio', 4, 8);

/* CS448 */
INSERT INTO questions VALUES(41,'Insert the question here...','option1 here', 'option2 here', 'option3 here', 'option4 here', 1, 9);
INSERT INTO questions VALUES(42,'Insert the question here...','option1 here', 'option2 here', 'option3 here', 'option4 here', 1, 9);
INSERT INTO questions VALUES(43,'Insert the question here...','option1 here', 'option2 here', 'option3 here', 'option4 here', 1, 9);
INSERT INTO questions VALUES(44,'Insert the question here...','option1 here', 'option2 here', 'option3 here', 'option4 here', 1, 9);
INSERT INTO questions VALUES(45,'Insert the question here...','option1 here', 'option2 here', 'option3 here', 'option4 here', 1, 9);

/* CS456 */
INSERT INTO questions VALUES(46,'Abstract syntaxes are classified as first-order abstract syntax (FOAS).','true', 'false', 'option3 here', 'option4 here', 1, 10);
INSERT INTO questions VALUES(47,'Which one is the tautology for Modus Tollens?','((p ^ (p -> q)) -> q', '(p ^ q) -> (q ^ p)', '(p -> q) -> (p -> (p ^ q))', '((~q ^ (p -> q)) -> ~p', 4, 10);
INSERT INTO questions VALUES(48,'Operational semantics are classified in which two categories?','Structural Operational Semantics and Natural Semantics', 'Natural Semantics and Unnatural Semantics', 'Structural Semantics and Operational Semantics', 'Structural Semantics and Denotational Semantics', 1, 10);
INSERT INTO questions VALUES(49,'Which is not a disadvantage of Mark and Sweep Algorithm?','Normal program execution is suspended while the garbage collection algorithm runs.', 'There are no additional overheads incurred during the execution of the algorithm.', 'After the algorithm is run several times on a program, reachable objects end up being separated by many, small unused memory regions.', 'option4 here', 2, 10);
INSERT INTO questions VALUES(50,'Which is not one of the fundamentally different kinds of polymorphism?','Ad hoc Polymorphism', 'Parametric Polymorphism', 'Subtyping', 'Hierarchical Polymorphism', 4, 10);

/* CS442 */
INSERT INTO questions VALUES(51,'What are protocols?','Agreements on how communication components and DTEs are to communicate', 'Logical communication channels for transferring data', 'Physical communication channels sued for transferring data', 'None of above', 1, 11);
INSERT INTO questions VALUES(52,'Which data communication method is used to transmit the data over a serial communication link?','Simplex', 'Half-duplex', 'Full duplex', 'All of the above', 3, 11);
INSERT INTO questions VALUES(53,'In communication satellite, multiple repeaters are known as?','Detectors', 'Modulators', 'Stations', 'Transponders', 4, 11);
INSERT INTO questions VALUES(54,'Error detection at the data link layer is achieved by?','Bit stuffing', 'Cyclic redundancy codes', 'Hamming codes', 'Equalization', 2, 11);
INSERT INTO questions VALUES(55,'Loss in signal power as light travels down the fiber is called?','Attenuation', 'Propagation', 'Scattering', 'Interruption', 1, 11);

/* CS426 */
INSERT INTO questions VALUES(56,'Which of the following is a strong password?','AwesomeSauce21', '1997Bread26', '*@2w5tJq4$P1aF7', '12$345', 3, 12);
INSERT INTO questions VALUES(57,'Which of the following cryptographic algorithms has not been broken?','MD5', 'DES', 'AES', 'SHA1', 3, 12);
INSERT INTO questions VALUES(58,'What is a cypher?','A cyborg.', 'A secret or disguised way of writing.', 'A sorting algorithm.', 'A data structure.', 2, 12);
INSERT INTO questions VALUES(59,'Which if the following is not a security vulnerability?','Buffer overflow.', 'SQL injection.', 'Use after free().', 'Infinite loop.', 4, 12);
INSERT INTO questions VALUES(60,'Which of the following methods of communication is private?','Telnet', 'SSH', 'HTTP', 'Email', 2, 12);




SELECT * from courses;
SELECT * from questions;