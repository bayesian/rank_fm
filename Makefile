CXX = g++
CXXFLAGS = -Wall -O3 -std=c++0x -march=native

DFLAG += -DUSESSE

# comment the following flags if you do not want to use OpenMP
DFLAG += -DUSEOMP
CXXFLAGS += -fopenmp

all: fm-train fm-predict

fm-train: ffm-train.cpp ffm.o
	$(CXX) $(CXXFLAGS) -o $@ $^

fm-predict: ffm-predict.cpp ffm.o
	$(CXX) $(CXXFLAGS) -o $@ $^

ffm.o: ffm.cpp ffm.h
	$(CXX) $(CXXFLAGS) $(DFLAG) -c -o $@ $<

clean:
	rm -f fm-train fm-predict ffm.o
