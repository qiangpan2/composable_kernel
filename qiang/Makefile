test1: test1.cpp
	hipcc --offload-arch=gfx1101 -o test1 test1.cpp

test_wmma1: test_wmma1.cpp
	hipcc --offload-arch=gfx1101 -o test_wmma1 test_wmma1.cpp

clean:
	rm -f test1 test_wmma1

run: test1
	./test1

run_wmma: test_wmma1
	./test_wmma1