test1: test1.cpp
	hipcc --offload-arch=gfx1101 -o test1 test1.cpp

clean:
	rm -f test1 

run: test1
	./test1