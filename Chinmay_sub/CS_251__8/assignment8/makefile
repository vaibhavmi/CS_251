all:cs251.ex1    

cs251.ex1:thread_function.o prog.o 
	gcc -pthread -o cs251.ex1 thread_function.o prog.o -lm
prog.o:prog.c common.h
	gcc -pthread -c prog.c -o prog.o
thread_function.o:thread_function.c common.h
	gcc -c thread_function.c -o thread_function.o -lm

clean:
	rm -f *.o cs251.ex1
	
